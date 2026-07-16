package com.gardenplanner.service;

import com.gardenplanner.model.Plant;
import com.gardenplanner.model.PropertyData;
import com.gardenplanner.model.SiteProfile;
import com.gardenplanner.rightmove.RightmovePageParser;
import com.google.gson.JsonObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
public class GapAnalyser {

    private static final Logger log = LoggerFactory.getLogger(GapAnalyser.class);

    private static final HttpClient HTTP_CLIENT = HttpClient.newBuilder()
            .followRedirects(HttpClient.Redirect.NORMAL)
            .build();

    private static final int RATE_LIMIT_MS = 5000;
    private static final int PROPERTIES_PER_LOCATION = 3;
    private static final Pattern PROPERTY_LINK = Pattern.compile("/properties/(\\d+)");

    private final EnvironmentService environmentService;
    private final RecommendationService recommendationService;

    record Channel(String label, String searchPath, String searchType) {}
    record Location(String name, String regionId) {}

    private static final List<Channel> CHANNELS = List.of(
            new Channel("Buy",     "property-for-sale",    "SALE"),
            new Channel("Rent",    "property-to-rent",     "RENT"),
            new Channel("New",     "new-homes-for-sale",   "SALE"),
            new Channel("Student", "student-accommodation","RENT")
    );

    private static final Map<String, List<Location>> LOCATIONS = Map.of(
            "property-for-sale", List.of(
                    new Location("London",      "REGION%5E87490"),
                    new Location("Edinburgh",   "REGION%5E475"),
                    new Location("Cornwall",    "REGION%5E61294"),
                    new Location("Norwich",     "REGION%5E1018"),
                    new Location("Whitby",      "REGION%5E1441"),   // seaside
                    new Location("Keswick",     "REGION%5E731"),    // hills/Lake District
                    new Location("Ely",         "REGION%5E483"),    // flat fens
                    new Location("Shrewsbury",  "REGION%5E1208"),   // rural
                    new Location("Aberystwyth", "REGION%5E11"),     // Welsh coast
                    new Location("Inverness",   "REGION%5E687")     // Scottish Highlands
            ),
            "property-to-rent", List.of(
                    new Location("Manchester",  "REGION%5E904"),
                    new Location("Birmingham",  "REGION%5E162"),
                    new Location("Bristol",     "REGION%5E219"),
                    new Location("Leeds",       "REGION%5E787"),
                    new Location("Glasgow",     "REGION%5E550"),
                    new Location("Scarborough", "REGION%5E1179"),   // seaside
                    new Location("Buxton",      "REGION%5E261"),    // Peak District hills
                    new Location("Wisbech",     "REGION%5E1469"),   // flat fens
                    new Location("Hereford",    "REGION%5E629"),    // rural
                    new Location("Llandudno",   "REGION%5E824")     // Welsh coast
            ),
            "new-homes-for-sale", List.of(
                    new Location("Milton Keynes","REGION%5E940"),
                    new Location("Reading",     "REGION%5E1114"),
                    new Location("Peterborough","REGION%5E1061"),
                    new Location("Exeter",      "REGION%5E494"),
                    new Location("Swindon",     "REGION%5E1306"),
                    new Location("Falmouth",    "REGION%5E502"),    // Cornish coast
                    new Location("Matlock",     "REGION%5E919"),    // Peak District
                    new Location("Spalding",    "REGION%5E1239"),   // Lincolnshire fens
                    new Location("Barnstaple",  "REGION%5E109"),    // North Devon rural
                    new Location("Chichester",  "REGION%5E316")     // South coast
            ),
            "student-accommodation", List.of(
                    new Location("Oxford",      "REGION%5E1036"),
                    new Location("Cambridge",   "REGION%5E274"),
                    new Location("Durham",      "REGION%5E460"),
                    new Location("Bath",        "REGION%5E116"),
                    new Location("Sheffield",   "REGION%5E1195"),
                    new Location("St Ives",     "REGION%5E1252"),   // Cornish coast
                    new Location("Fort William","REGION%5E528"),    // Scottish Highlands
                    new Location("Margate",     "REGION%5E909"),    // Kent coast
                    new Location("Eastbourne",  "REGION%5E470"),    // South coast
                    new Location("Penrith",     "REGION%5E1052")    // rural Cumbria
            )
    );

    record ConditionKey(String soilType, String drainage, String ph, String hardiness) {
        @Override public String toString() {
            return String.format("soil=%s, drainage=%s, pH=%s, hardiness=%s", soilType, drainage, ph, hardiness);
        }
    }

    record PropertyResult(String propertyId, String address, String channel,
                          ConditionKey conditions, SiteProfile profile,
                          int outdoorMatches, int indoorMatches) {}

    public GapAnalyser(EnvironmentService environmentService,
                       RecommendationService recommendationService) {
        this.environmentService = environmentService;
        this.recommendationService = recommendationService;
    }

    public void run() {
        log.info("=== Gap Analysis Started ===");
        log.info("Sampling 100 properties (25 per channel) across diverse UK locations");
        log.info("Rate limit: 1 Rightmove request per {} seconds", RATE_LIMIT_MS / 1000);
        System.out.println();

        List<PropertyResult> results = new ArrayList<>();
        int totalFetched = 0;
        int totalFailed = 0;

        for (Channel channel : CHANNELS) {
            List<Location> locations = LOCATIONS.get(channel.searchPath());
            System.out.printf("--- Channel: %s ---%n", channel.label());
            int channelCount = 0;

            for (Location location : locations) {
                if (channelCount >= 25) break;
                System.out.printf("  Searching %s for %s properties...%n", location.name(), channel.label());
                List<String> propertyIds = fetchPropertyIds(channel, location);

                if (propertyIds.isEmpty()) {
                    System.out.printf("    No properties found, skipping.%n");
                    continue;
                }

                int count = 0;
                for (String id : propertyIds) {
                    if (count >= PROPERTIES_PER_LOCATION || channelCount >= 25) break;

                    rateLimitSleep();
                    try {
                        PropertyResult result = analyseProperty(id, channel.label());
                        if (result != null) {
                            results.add(result);
                            count++;
                            channelCount++;
                            totalFetched++;
                            System.out.printf("    [%d/100] %s — %s | outdoor=%d, indoor=%d%n",
                                    totalFetched, id, result.conditions(), result.outdoorMatches(), result.indoorMatches());
                        }
                    } catch (Exception e) {
                        totalFailed++;
                        System.out.printf("    [SKIP] %s — %s%n", id, e.getMessage());
                    }
                }
            }
            System.out.println();
        }

        System.out.println("=== Analysis Complete ===");
        System.out.printf("Properties analysed: %d | Failed: %d%n%n", totalFetched, totalFailed);

        GapReport report = buildReport(results);
        printReport(report);

        String sql = generateGapFillingSql(report);
        writeOutputFiles(report, sql);
    }

    private List<String> fetchPropertyIds(Channel channel, Location location) {
        String url = String.format(
                "https://www.rightmove.co.uk/%s/find.html?searchType=%s&locationIdentifier=%s",
                channel.searchPath(), channel.searchType(), location.regionId());

        try {
            rateLimitSleep();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
                    .GET()
                    .build();

            HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());
            String html = response.body();

            Set<String> ids = new LinkedHashSet<>();
            Matcher matcher = PROPERTY_LINK.matcher(html);
            while (matcher.find() && ids.size() < PROPERTIES_PER_LOCATION + 5) {
                ids.add(matcher.group(1));
            }

            return new ArrayList<>(ids);
        } catch (Exception e) {
            log.warn("Failed to fetch search results for {} in {}: {}", channel.searchPath(), location.name(), e.getMessage());
            return List.of();
        }
    }

    private PropertyResult analyseProperty(String propertyId, String channelLabel)
            throws IOException, InterruptedException {
        JsonObject pageModel = RightmovePageParser.fetchPageModel(propertyId);
        PropertyData property = RightmovePageParser.parseProperty(propertyId, pageModel);

        SiteProfile profile = environmentService.buildProfile(property);

        List<Plant> outdoor = recommendationService.recommend(profile, true);
        List<Plant> indoor = recommendationService.recommend(profile, false);

        ConditionKey key = new ConditionKey(
                profile.getSoilType(),
                profile.getSoilDrainage(),
                profile.getSoilPhRange(),
                profile.getRhsHardinessZone()
        );

        return new PropertyResult(propertyId, property.getDisplayAddress(), channelLabel,
                key, profile, outdoor.size(), indoor.size());
    }

    record GapReport(
            List<PropertyResult> allResults,
            Map<ConditionKey, List<PropertyResult>> byCondition,
            List<Map.Entry<ConditionKey, List<PropertyResult>>> gaps
    ) {}

    private GapReport buildReport(List<PropertyResult> results) {
        Map<ConditionKey, List<PropertyResult>> byCondition = results.stream()
                .collect(Collectors.groupingBy(PropertyResult::conditions, LinkedHashMap::new, Collectors.toList()));

        List<Map.Entry<ConditionKey, List<PropertyResult>>> gaps = byCondition.entrySet().stream()
                .filter(e -> {
                    double avgMatches = e.getValue().stream()
                            .mapToInt(PropertyResult::outdoorMatches)
                            .average().orElse(0);
                    return avgMatches < 10;
                })
                .sorted(Comparator.comparingDouble(e ->
                        e.getValue().stream().mapToInt(PropertyResult::outdoorMatches).average().orElse(0)))
                .toList();

        return new GapReport(results, byCondition, gaps);
    }

    private void printReport(GapReport report) {
        System.out.println("=== Condition Coverage Summary ===");
        System.out.printf("Unique condition combos found: %d%n%n", report.byCondition().size());

        System.out.println("Condition combo                                           | Properties | Avg outdoor | Avg indoor");
        System.out.println("----------------------------------------------------------+------------+-------------+-----------");
        for (var entry : report.byCondition().entrySet()) {
            double avgOut = entry.getValue().stream().mapToInt(PropertyResult::outdoorMatches).average().orElse(0);
            double avgIn = entry.getValue().stream().mapToInt(PropertyResult::indoorMatches).average().orElse(0);
            System.out.printf("%-58s | %10d | %11.1f | %9.1f%n",
                    entry.getKey(), entry.getValue().size(), avgOut, avgIn);
        }

        System.out.println();
        if (report.gaps().isEmpty()) {
            System.out.println("No significant gaps found — all condition combos have >= 10 outdoor matches.");
        } else {
            System.out.printf("=== Gaps Found: %d condition combos with < 10 avg outdoor matches ===%n%n", report.gaps().size());
            for (var entry : report.gaps()) {
                double avgOut = entry.getValue().stream().mapToInt(PropertyResult::outdoorMatches).average().orElse(0);
                System.out.printf("  GAP: %s — avg %.1f outdoor matches%n", entry.getKey(), avgOut);
                for (PropertyResult pr : entry.getValue()) {
                    System.out.printf("       Property %s (%s) — %d outdoor, %d indoor%n",
                            pr.propertyId(), pr.address(), pr.outdoorMatches(), pr.indoorMatches());
                }
                System.out.println();
            }
        }
    }

    private String generateGapFillingSql(GapReport report) {
        Set<String> neededSoilTypes = new HashSet<>();
        Set<String> neededDrainage = new HashSet<>();
        Set<String> neededPh = new HashSet<>();
        Set<String> neededHardiness = new HashSet<>();

        for (var entry : report.gaps()) {
            ConditionKey key = entry.getKey();
            neededSoilTypes.add(key.soilType());
            neededDrainage.add(key.drainage());
            neededPh.add(key.ph());
            neededHardiness.add(key.hardiness());
        }

        List<CandidatePlant> selected = new ArrayList<>();
        for (CandidatePlant cp : CANDIDATE_PLANTS) {
            boolean fills = false;
            for (var entry : report.gaps()) {
                ConditionKey gap = entry.getKey();
                if (cp.matchesCondition(gap)) {
                    fills = true;
                    break;
                }
            }
            if (fills) selected.add(cp);
        }

        if (report.gaps().isEmpty()) {
            selected = new ArrayList<>(CANDIDATE_PLANTS);
        }

        StringBuilder sb = new StringBuilder();
        sb.append("-- Gap-filling plants generated by GapAnalyser\n");
        sb.append("-- Run: ").append(java.time.LocalDate.now()).append("\n");
        sb.append("-- Gaps found: ").append(report.gaps().size()).append(" condition combos\n");
        sb.append("-- Plants added: ").append(selected.size()).append("\n\n");

        for (CandidatePlant cp : selected) {
            String escapedDesc = cp.description.replace("'", "''");
            String escapedCommon = cp.commonName.replace("'", "''");
            sb.append(String.format(
                    "INSERT OR IGNORE INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES\n" +
                    "('%s', '%s', '%s', '%s', %d);\n",
                    escapedCommon, cp.latinName, cp.plantType, escapedDesc, cp.indoor ? 1 : 0));

            sb.append(String.format(
                    "INSERT OR IGNORE INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, " +
                    "min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) \n" +
                    "SELECT id, '%s', '%s', '%s', '%s', %s, '%s', %d, %d FROM plants WHERE common_name = '%s' " +
                    "AND NOT EXISTS (SELECT 1 FROM plant_requirements WHERE plant_id = (SELECT id FROM plants WHERE common_name = '%s'));\n\n",
                    cp.hardiness, cp.soilTypes, cp.ph, cp.drainage,
                    cp.minSunHours == null ? "NULL" : String.valueOf(cp.minSunHours),
                    cp.sunPreference, cp.pollutionTolerant ? 1 : 0, cp.hardWaterTolerant ? 1 : 0,
                    escapedCommon, escapedCommon));
        }

        return sb.toString();
    }

    private void writeOutputFiles(GapReport report, String sql) {
        try {
            Path outputDir = Path.of("gap-analysis-output");
            Files.createDirectories(outputDir);

            Files.writeString(outputDir.resolve("gap_filling_plants.sql"), sql);

            StringBuilder summary = new StringBuilder();
            summary.append("Gap Analysis Report\n");
            summary.append("===================\n");
            summary.append(String.format("Date: %s%n", java.time.LocalDate.now()));
            summary.append(String.format("Properties analysed: %d%n", report.allResults().size()));
            summary.append(String.format("Unique condition combos: %d%n", report.byCondition().size()));
            summary.append(String.format("Gaps (< 10 avg matches): %d%n%n", report.gaps().size()));

            summary.append("All condition combos:\n");
            for (var entry : report.byCondition().entrySet()) {
                double avg = entry.getValue().stream().mapToInt(PropertyResult::outdoorMatches).average().orElse(0);
                summary.append(String.format("  %s — %.1f avg matches (%d properties)%n",
                        entry.getKey(), avg, entry.getValue().size()));
            }

            if (!report.gaps().isEmpty()) {
                summary.append("\nGap details:\n");
                for (var entry : report.gaps()) {
                    double avg = entry.getValue().stream().mapToInt(PropertyResult::outdoorMatches).average().orElse(0);
                    summary.append(String.format("  %s — %.1f avg matches%n", entry.getKey(), avg));
                }
            }

            Files.writeString(outputDir.resolve("report.txt"), summary);

            System.out.println("=== Output Files ===");
            System.out.println("  gap-analysis-output/report.txt          — summary report");
            System.out.println("  gap-analysis-output/gap_filling_plants.sql — SQL to add gap-filling plants");
            System.out.printf("%n  To apply: sqlite3 garden_planner.db < gap-analysis-output/gap_filling_plants.sql%n");

        } catch (IOException e) {
            log.error("Failed to write output files", e);
        }
    }

    private void rateLimitSleep() {
        try {
            Thread.sleep(RATE_LIMIT_MS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    record CandidatePlant(String commonName, String latinName, String plantType,
                          String description, boolean indoor,
                          String hardiness, String soilTypes, String ph,
                          String drainage, Double minSunHours, String sunPreference,
                          boolean pollutionTolerant, boolean hardWaterTolerant) {

        boolean matchesCondition(ConditionKey gap) {
            boolean soilOk = soilTypes.equalsIgnoreCase("any") || soilTypes.toLowerCase().contains(gap.soilType().toLowerCase());
            boolean phOk = ph.equalsIgnoreCase("any") || ph.toLowerCase().contains(gap.ph().toLowerCase());
            boolean drainOk = drainage.equalsIgnoreCase("any") || drainage.toLowerCase().contains(gap.drainage().toLowerCase());

            int plantH = hardinesLevel(hardiness);
            int gapH = hardinesLevel(gap.hardiness());
            boolean hardOk = plantH >= gapH;

            return soilOk && phOk && drainOk && hardOk;
        }

        private static int hardinesLevel(String h) {
            return switch (h) {
                case "H1a" -> 1; case "H1b" -> 2; case "H1c" -> 3;
                case "H2" -> 4; case "H3" -> 5; case "H4" -> 6;
                case "H5" -> 7; case "H6" -> 8; case "H7" -> 9;
                default -> 5;
            };
        }
    }

    private static final List<CandidatePlant> CANDIDATE_PLANTS = List.of(
            // === Alkaline chalk + free draining ===
            new CandidatePlant("Globe Thistle", "Echinops ritro", "perennial",
                    "Striking spherical steel-blue flower heads on tall stems from July to September. Extremely drought-tolerant. Loved by bees.",
                    false, "H7", "chalk,loam,sand", "alkaline,neutral", "free", 1300.0, "full_sun", true, true),
            new CandidatePlant("Sea Holly", "Eryngium maritimum", "perennial",
                    "Architectural plant with spiky silver-blue flowers and foliage. Native coastal species. Thrives in poor, dry soil.",
                    false, "H5", "chalk,sand", "alkaline,neutral", "free", 1400.0, "full_sun", true, true),
            new CandidatePlant("Verbena", "Verbena bonariensis", "perennial",
                    "Tall airy stems topped with clusters of tiny purple flowers. Flowers from June to first frost. Self-seeds generously.",
                    false, "H4", "chalk,loam,sand", "alkaline,neutral", "free", 1300.0, "full_sun", true, true),
            new CandidatePlant("Pinks", "Dianthus", "perennial",
                    "Compact fragrant flowers in shades of pink, red, and white. Cottage garden staple. Needs sharp drainage.",
                    false, "H5", "chalk,loam,sand", "alkaline,neutral", "free", 1300.0, "full_sun", true, true),
            new CandidatePlant("Stonecrop", "Sedum spectabile", "perennial",
                    "Fleshy-leaved succulent with flat pink flower heads in autumn. Important late nectar source for butterflies. Extremely tough.",
                    false, "H7", "chalk,loam,sand", "alkaline,neutral", "free", 1200.0, "full_sun", true, true),
            new CandidatePlant("Bearded Iris", "Iris germanica", "perennial",
                    "Flamboyant flowers in every colour from May to June. Rhizomes need baking in sun. Excellent for hot, dry borders.",
                    false, "H7", "chalk,loam,sand", "alkaline,neutral", "free", 1400.0, "full_sun", true, true),

            // === Heavy clay + impeded/waterlogged ===
            new CandidatePlant("Marsh Marigold", "Caltha palustris", "perennial",
                    "Cheerful golden flowers in March-April. Native wildflower for pond margins, bog gardens, and damp ditches.",
                    false, "H7", "clay,loam", "acid,neutral", "waterlogged,moist,impeded", 800.0, "full_sun", true, true),
            new CandidatePlant("Siberian Iris", "Iris sibirica", "perennial",
                    "Elegant blue or white flowers on grassy foliage in June. Thrives in heavy, damp clay where many plants fail.",
                    false, "H7", "clay,loam", "acid,neutral", "moist,impeded,waterlogged", 1000.0, "full_sun", true, true),
            new CandidatePlant("Ligularia", "Ligularia dentata", "perennial",
                    "Bold architectural plant with large round leaves and orange daisy flowers. Needs consistently moist soil — wilts in drought.",
                    false, "H7", "clay,loam", "acid,neutral", "moist,impeded,waterlogged", 800.0, "partial_shade", true, true),
            new CandidatePlant("Meadowsweet", "Filipendula ulmaria", "perennial",
                    "Fragrant creamy-white flower plumes from June to September. Native wildflower for damp meadows and stream banks.",
                    false, "H7", "clay,loam", "acid,neutral", "moist,impeded,waterlogged", 800.0, "full_sun", true, true),
            new CandidatePlant("Purple Loosestrife", "Lythrum salicaria", "perennial",
                    "Tall spikes of vivid magenta flowers from June to September. Superb for wet clay and pond margins. Loved by bees.",
                    false, "H7", "clay,loam", "neutral", "moist,impeded,waterlogged", 1000.0, "full_sun", true, true),

            // === Sandy acid + free draining ===
            new CandidatePlant("Gorse", "Ulex europaeus", "shrub",
                    "Spiny evergreen native shrub with coconut-scented yellow flowers almost year-round. Thrives on the poorest, most acid soils.",
                    false, "H7", "sand,loam", "acid", "free", 1200.0, "full_sun", true, false),
            new CandidatePlant("Broom", "Cytisus scoparius", "shrub",
                    "Fast-growing deciduous shrub smothered in yellow pea flowers in May-June. Ideal for dry banks and sandy acid soils.",
                    false, "H6", "sand,loam", "acid", "free", 1200.0, "full_sun", true, false),
            new CandidatePlant("Pieris", "Pieris japonica", "shrub",
                    "Evergreen shrub with striking red new growth and cascading white bell flowers in spring. Must have acid soil.",
                    false, "H5", "loam,sand", "acid", "moist,free", 1000.0, "partial_shade", false, false),
            new CandidatePlant("Azalea", "Rhododendron (Azalea)", "shrub",
                    "Compact deciduous or evergreen shrub with vibrant spring flowers. Needs acid soil — grow in ericaceous compost if needed.",
                    false, "H5", "loam,sand", "acid", "moist,free", 1000.0, "partial_shade", false, false),
            new CandidatePlant("Bilberry", "Vaccinium myrtillus", "shrub",
                    "Low-growing native shrub producing small sweet berries in summer. Found on acid heaths and moors. Edible wild fruit.",
                    false, "H7", "sand,loam,peat", "acid", "free,moist", 1000.0, "partial_shade", true, false),

            // === Very cold + exposed (Scotland, Northern England) ===
            new CandidatePlant("Silver Birch", "Betula pendula", "tree",
                    "Elegant native tree with white bark and golden autumn colour. Pioneer species — grows almost anywhere including poor soil.",
                    false, "H7", "any", "any", "free,moist", null, "full_sun", true, true),
            new CandidatePlant("Rowan", "Sorbus aucuparia", "tree",
                    "Hardy native tree with white spring flowers and bright red autumn berries. Grows at higher altitudes than any other UK tree.",
                    false, "H7", "any", "acid,neutral", "free,moist", null, "full_sun", true, true),
            new CandidatePlant("Hawthorn", "Crataegus monogyna", "tree",
                    "Tough native hedging and specimen tree. White May blossom, red autumn haws. Supports over 300 insect species.",
                    false, "H7", "any", "any", "any", null, "full_sun", true, true),
            new CandidatePlant("Wild Rose", "Rosa canina", "shrub",
                    "Native dog rose with single pink flowers in June and red hips in autumn. Extremely hardy. Grows in hedgerows and woodland edges.",
                    false, "H7", "any", "any", "free,moist", null, "full_sun", true, true),
            new CandidatePlant("Scots Pine", "Pinus sylvestris", "tree",
                    "Iconic native conifer with distinctive orange bark and blue-green needles. Thrives on poor acid soils in exposed conditions.",
                    false, "H7", "sand,loam", "acid,neutral", "free", null, "full_sun", true, true),

            // === Urban / pollution tolerant ===
            new CandidatePlant("Holly", "Ilex aquifolium", "tree",
                    "Evergreen native tree with glossy spiny leaves and red winter berries. Excellent for hedging. Very pollution-tolerant.",
                    false, "H7", "any", "any", "free,moist", null, "partial_shade", true, true),
            new CandidatePlant("Privet", "Ligustrum ovalifolium", "shrub",
                    "Classic semi-evergreen hedging plant. Fast-growing, tolerates heavy clipping, pollution, and most soils. White summer flowers.",
                    false, "H6", "any", "any", "any", null, "full_sun", true, true),
            new CandidatePlant("Pyracantha", "Pyracantha coccinea", "shrub",
                    "Thorny evergreen wall shrub with white flowers and masses of orange-red berries. Brilliant for security hedging and wildlife.",
                    false, "H6", "any", "any", "free,moist", null, "full_sun", true, true),
            new CandidatePlant("Cotoneaster", "Cotoneaster horizontalis", "shrub",
                    "Low-spreading evergreen with herringbone branches. Red autumn berries loved by birds. Grows on walls, banks, and poor ground.",
                    false, "H6", "any", "any", "free,moist", null, "full_sun", true, true),
            new CandidatePlant("Mahonia", "Mahonia aquifolium", "shrub",
                    "Evergreen shrub with holly-like leaves and yellow winter flowers followed by blue berries. Tough and shade-tolerant.",
                    false, "H6", "any", "any", "any", null, "partial_shade", true, true),

            // === Peat / boggy conditions ===
            new CandidatePlant("Bog Rosemary", "Andromeda polifolia", "shrub",
                    "Dainty evergreen dwarf shrub with pink bell flowers. Native to peat bogs. Needs acid, permanently moist conditions.",
                    false, "H7", "peat,loam", "acid", "moist,waterlogged,impeded", null, "full_sun", true, false),
            new CandidatePlant("Ragged Robin", "Silene flos-cuculi", "perennial",
                    "Charming native wildflower with deeply-cut pink petals. Thrives in damp meadows and marshy ground.",
                    false, "H7", "clay,loam,peat", "acid,neutral", "moist,impeded,waterlogged", null, "full_sun", true, true),
            new CandidatePlant("Royal Fern", "Osmunda regalis", "perennial",
                    "Magnificent native fern reaching 1.5m tall. Needs permanently moist, acid soil. Stunning autumn colour. Slow to establish.",
                    false, "H7", "loam,peat", "acid", "moist,waterlogged,impeded", null, "partial_shade", true, false),

            // === Indoor — additional variety ===
            new CandidatePlant("Prayer Plant", "Maranta leuconeura", "perennial",
                    "Tropical houseplant with beautifully patterned leaves that fold upward at night. Needs humidity and filtered water.",
                    true, "H1a", "loam", "acid,neutral", "moist", null, "partial_shade", true, false),
            new CandidatePlant("Tradescantia", "Tradescantia zebrina", "perennial",
                    "Fast-growing trailing plant with striking purple-and-silver striped leaves. Very easy to propagate from cuttings.",
                    true, "H1c", "loam", "neutral", "moist,free", null, "partial_shade", true, true),
            new CandidatePlant("Philodendron", "Philodendron scandens", "climber",
                    "Heart-shaped glossy leaves on trailing or climbing stems. Tolerates low light well. Classic easy-care houseplant.",
                    true, "H1b", "loam", "neutral", "moist,free", null, "partial_shade", true, true),
            new CandidatePlant("Dragon Tree", "Dracaena marginata", "tree",
                    "Architectural indoor tree with narrow sword-like leaves on bare cane stems. Very tolerant of neglect and low light.",
                    true, "H1b", "loam,sand", "neutral", "free", null, "partial_shade", true, true),
            new CandidatePlant("African Violet", "Saintpaulia", "perennial",
                    "Compact flowering houseplant that blooms almost year-round in the right conditions. Sensitive to cold water on leaves.",
                    true, "H1a", "loam", "acid,neutral", "moist", null, "partial_shade", true, false),
            new CandidatePlant("Nerve Plant", "Fittonia albivenis", "perennial",
                    "Low-growing tropical plant with intricately veined leaves in pink, red, or white. Needs high humidity — ideal for terrariums.",
                    true, "H1a", "loam", "neutral", "moist", null, "full_shade", true, true),
            new CandidatePlant("Peperomia", "Peperomia obtusifolia", "perennial",
                    "Compact succulent-like houseplant with thick glossy leaves. Low maintenance and tolerant of irregular watering.",
                    true, "H1b", "loam,sand", "neutral", "free,moist", null, "partial_shade", true, true)
    );
}
