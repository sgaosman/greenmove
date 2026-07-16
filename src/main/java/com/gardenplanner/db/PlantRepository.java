package com.gardenplanner.db;

import com.gardenplanner.model.Plant;
import com.gardenplanner.model.SiteProfile;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@Repository
public class PlantRepository {

    private final Database database;

    private static final int MINIMUM_SCORE = 35;

    private static final Map<String, Integer> HARDINESS_ORDER = Map.ofEntries(
            Map.entry("H1a", 1), Map.entry("H1b", 2), Map.entry("H1c", 3),
            Map.entry("H2", 4), Map.entry("H3", 5), Map.entry("H4", 6),
            Map.entry("H5", 7), Map.entry("H6", 8), Map.entry("H7", 9)
    );

    private static final List<String> PH_SCALE = List.of("acid", "neutral", "alkaline");

    private static final Map<String, Integer> DRAINAGE_RANK = Map.of(
            "free", 1, "moist", 2, "impeded", 3, "waterlogged", 4
    );

    public PlantRepository(Database database) {
        this.database = database;
    }

    public List<Plant> findMatchingPlants(SiteProfile profile, boolean gardenOnly) {
        return findMatchingPlants(profile, gardenOnly, List.of());
    }

    public List<Plant> findMatchingPlants(SiteProfile profile, boolean gardenOnly, List<String> pets) {
        String sql = """
                SELECT p.id, p.common_name, p.latin_name, p.plant_type,
                       p.description, p.image_url, p.is_indoor, p.purpose,
                       pr.min_hardiness, pr.soil_types, pr.soil_ph,
                       pr.drainage, pr.min_sun_hours, pr.sun_preference,
                       pr.pollution_tolerant, pr.hard_water_tolerant
                FROM plants p
                JOIN plant_requirements pr ON p.id = pr.plant_id
                """;

        String toxSql = "SELECT animal, toxic_flag, severity, notes FROM plant_toxicity WHERE plant_id = ?";

        List<Plant> matches = new ArrayList<>();

        try (Connection conn = database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                boolean isIndoor = rs.getInt("is_indoor") == 1;
                if (gardenOnly && isIndoor) continue;
                if (!gardenOnly && !isIndoor) continue;

                Plant plant = new Plant();
                int score = calculateSuitability(rs, profile, isIndoor, plant);
                if (score < MINIMUM_SCORE) continue;

                int plantId = rs.getInt("id");

                plant.setId(plantId);
                plant.setCommonName(rs.getString("common_name"));
                plant.setLatinName(rs.getString("latin_name"));
                plant.setPlantType(rs.getString("plant_type"));
                plant.setDescription(rs.getString("description"));
                plant.setImageUrl(rs.getString("image_url"));
                plant.setIndoor(isIndoor);
                plant.setPurpose(rs.getString("purpose"));
                plant.setSuitabilityScore(score);
                plant.setSuitabilityLabel(labelForScore(score));
                plant.setReqHardiness(rs.getString("min_hardiness"));
                plant.setReqSoil(rs.getString("soil_types"));
                plant.setReqPh(rs.getString("soil_ph"));
                plant.setReqDrainage(rs.getString("drainage"));
                plant.setReqPollutionTolerant(rs.getInt("pollution_tolerant") == 1);
                plant.setReqHardWaterTolerant(rs.getInt("hard_water_tolerant") == 1);

                loadToxicity(conn, toxSql, plantId, plant);

                if (!pets.isEmpty()) {
                    boolean dangerousToAnyPet = pets.stream().anyMatch(plant::isToxicTo);
                    if (dangerousToAnyPet) continue;
                }

                matches.add(plant);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to query plants", e);
        }

        matches.sort(Comparator.comparingInt(Plant::getSuitabilityScore).reversed()
                .thenComparing(Plant::getCommonName));
        return matches;
    }

    private void loadToxicity(Connection conn, String toxSql, int plantId, Plant plant) throws SQLException {
        try (PreparedStatement toxPs = conn.prepareStatement(toxSql)) {
            toxPs.setInt(1, plantId);
            try (ResultSet toxRs = toxPs.executeQuery()) {
                Map<String, Plant.ToxicityInfo> toxMap = new LinkedHashMap<>();
                while (toxRs.next()) {
                    String animal = toxRs.getString("animal");
                    boolean toxic = toxRs.getInt("toxic_flag") == 1;
                    String severity = toxRs.getString("severity");
                    String notes = toxRs.getString("notes");
                    toxMap.put(animal, new Plant.ToxicityInfo(toxic, severity, notes));
                }
                plant.setToxicity(toxMap);
            }
        }
    }

    private int calculateSuitability(ResultSet rs, SiteProfile profile, boolean isIndoor, Plant plant) throws SQLException {
        double pollutionScore = scorePollution(rs.getInt("pollution_tolerant"), profile.getAirQualityIndex());
        double waterScore = scoreWater(rs.getInt("hard_water_tolerant"), profile.getWaterHardnessPpm());

        plant.setPollutionScore(pollutionScore);
        plant.setWaterScore(waterScore);

        if (isIndoor) {
            double weighted = pollutionScore * 0.5 + waterScore * 0.5;
            return (int) Math.round(weighted * 100);
        }

        double hardinessScore = scoreHardiness(rs.getString("min_hardiness"), profile.getRhsHardinessZone());
        double soilScore = scoreSoil(rs.getString("soil_types"), profile.getSoilType());
        double phScore = scorePh(rs.getString("soil_ph"), profile.getSoilPhRange());
        double drainageScore = scoreDrainage(rs.getString("drainage"), profile.getSoilDrainage());

        plant.setHardinessScore(hardinessScore);
        plant.setSoilScore(soilScore);
        plant.setPhScore(phScore);
        plant.setDrainageScore(drainageScore);

        double weighted = hardinessScore * 0.30
                + soilScore * 0.15
                + phScore * 0.15
                + drainageScore * 0.15
                + pollutionScore * 0.15
                + waterScore * 0.10;

        if (hardinessScore < 0.2) {
            weighted = Math.min(weighted, 0.30);
        }

        return (int) Math.round(weighted * 100);
    }

    private double scoreHardiness(String plantMinHardiness, String siteHardiness) {
        if (plantMinHardiness == null || siteHardiness == null) return 1.0;
        int plantLevel = HARDINESS_ORDER.getOrDefault(plantMinHardiness, 5);
        int siteLevel = HARDINESS_ORDER.getOrDefault(siteHardiness, 5);
        int diff = plantLevel - siteLevel;
        if (diff >= 0) return 1.0;
        if (diff == -1) return 0.6;
        if (diff == -2) return 0.3;
        return 0.0;
    }

    private double scoreSoil(String plantSoilTypes, String siteSoilType) {
        if (plantSoilTypes == null || plantSoilTypes.isBlank()) return 1.0;
        if (siteSoilType == null) return 1.0;
        if (plantSoilTypes.equalsIgnoreCase("any")) return 1.0;

        String lower = plantSoilTypes.toLowerCase();
        String siteLower = siteSoilType.toLowerCase();

        if (lower.contains(siteLower)) return 1.0;

        int plantTypeCount = lower.split(",").length;
        if (plantTypeCount >= 3) return 0.6;
        if (plantTypeCount >= 2) return 0.45;
        return 0.3;
    }

    private double scorePh(String plantPh, String sitePh) {
        if (plantPh == null || plantPh.isBlank()) return 1.0;
        if (sitePh == null) return 1.0;
        if (plantPh.equalsIgnoreCase("any")) return 1.0;

        String lower = plantPh.toLowerCase();
        String siteLower = sitePh.toLowerCase();

        if (lower.contains(siteLower)) return 1.0;

        int plantIdx = bestPhIndex(lower);
        int siteIdx = PH_SCALE.indexOf(siteLower);
        if (plantIdx < 0 || siteIdx < 0) return 0.5;

        int distance = Math.abs(plantIdx - siteIdx);
        if (distance == 1) return 0.6;
        return 0.25;
    }

    private int bestPhIndex(String plantPh) {
        int best = -1;
        for (int i = 0; i < PH_SCALE.size(); i++) {
            if (plantPh.contains(PH_SCALE.get(i))) {
                best = i;
            }
        }
        return best;
    }

    private double scoreDrainage(String plantDrainage, String siteDrainage) {
        if (plantDrainage == null || plantDrainage.isBlank()) return 1.0;
        if (siteDrainage == null) return 1.0;
        if (plantDrainage.equalsIgnoreCase("any")) return 1.0;

        String lower = plantDrainage.toLowerCase();
        String siteLower = siteDrainage.toLowerCase();

        if (lower.contains(siteLower)) return 1.0;

        int siteRank = DRAINAGE_RANK.getOrDefault(siteLower, 2);
        int minDistance = Integer.MAX_VALUE;
        for (String part : lower.split(",")) {
            int rank = DRAINAGE_RANK.getOrDefault(part.trim(), 2);
            minDistance = Math.min(minDistance, Math.abs(rank - siteRank));
        }

        if (minDistance == 1) return 0.6;
        if (minDistance == 2) return 0.35;
        return 0.2;
    }

    private double scorePollution(int tolerant, int aqi) {
        if (tolerant == 1) return 1.0;
        if (aqi <= 20) return 1.0;
        if (aqi <= 40) return 0.8;
        if (aqi <= 60) return 0.5;
        if (aqi <= 80) return 0.25;
        return 0.1;
    }

    private double scoreWater(int tolerant, double hardnessPpm) {
        if (tolerant == 1) return 1.0;
        if (hardnessPpm <= 100) return 1.0;
        if (hardnessPpm <= 200) return 0.7;
        if (hardnessPpm <= 300) return 0.4;
        return 0.2;
    }

    private String labelForScore(int score) {
        if (score >= 85) return "Perfect Match";
        if (score >= 70) return "Great Match";
        if (score >= 55) return "Good Match";
        return "Worth Trying";
    }
}
