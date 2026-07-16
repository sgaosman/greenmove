package com.gardenplanner.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Plant {

    private int id;
    private String commonName;
    private String latinName;
    private String plantType;
    private String description;
    private String imageUrl;
    private boolean indoor;
    private String purpose;
    private int suitabilityScore;
    private String suitabilityLabel;
    private Map<String, ToxicityInfo> toxicity = new LinkedHashMap<>();
    private double hardinessScore;
    private double soilScore;
    private double phScore;
    private double drainageScore;
    private double pollutionScore;
    private double waterScore;
    private String reqHardiness;
    private String reqSoil;
    private String reqPh;
    private String reqDrainage;
    private boolean reqPollutionTolerant;
    private boolean reqHardWaterTolerant;

    public record ToxicityInfo(boolean toxic, String severity, String notes) {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCommonName() { return commonName; }
    public void setCommonName(String commonName) { this.commonName = commonName; }

    public String getLatinName() { return latinName; }
    public void setLatinName(String latinName) { this.latinName = latinName; }

    public String getPlantType() { return plantType; }
    public void setPlantType(String plantType) { this.plantType = plantType; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public boolean isIndoor() { return indoor; }
    public void setIndoor(boolean indoor) { this.indoor = indoor; }

    public String getPurpose() { return purpose; }
    public void setPurpose(String purpose) { this.purpose = purpose; }

    public int getSuitabilityScore() { return suitabilityScore; }
    public void setSuitabilityScore(int suitabilityScore) { this.suitabilityScore = suitabilityScore; }

    public String getSuitabilityLabel() { return suitabilityLabel; }
    public void setSuitabilityLabel(String suitabilityLabel) { this.suitabilityLabel = suitabilityLabel; }

    public Map<String, ToxicityInfo> getToxicity() { return toxicity; }
    public void setToxicity(Map<String, ToxicityInfo> toxicity) { this.toxicity = toxicity; }

    public double getHardinessScore() { return hardinessScore; }
    public void setHardinessScore(double hardinessScore) { this.hardinessScore = hardinessScore; }

    public double getSoilScore() { return soilScore; }
    public void setSoilScore(double soilScore) { this.soilScore = soilScore; }

    public double getPhScore() { return phScore; }
    public void setPhScore(double phScore) { this.phScore = phScore; }

    public double getDrainageScore() { return drainageScore; }
    public void setDrainageScore(double drainageScore) { this.drainageScore = drainageScore; }

    public double getPollutionScore() { return pollutionScore; }
    public void setPollutionScore(double pollutionScore) { this.pollutionScore = pollutionScore; }

    public double getWaterScore() { return waterScore; }
    public void setWaterScore(double waterScore) { this.waterScore = waterScore; }

    public String getReqHardiness() { return reqHardiness; }
    public void setReqHardiness(String reqHardiness) { this.reqHardiness = reqHardiness; }

    public String getReqSoil() { return reqSoil; }
    public void setReqSoil(String reqSoil) { this.reqSoil = reqSoil; }

    public String getReqPh() { return reqPh; }
    public void setReqPh(String reqPh) { this.reqPh = reqPh; }

    public String getReqDrainage() { return reqDrainage; }
    public void setReqDrainage(String reqDrainage) { this.reqDrainage = reqDrainage; }

    public boolean isReqPollutionTolerant() { return reqPollutionTolerant; }
    public void setReqPollutionTolerant(boolean reqPollutionTolerant) { this.reqPollutionTolerant = reqPollutionTolerant; }

    public boolean isReqHardWaterTolerant() { return reqHardWaterTolerant; }
    public void setReqHardWaterTolerant(boolean reqHardWaterTolerant) { this.reqHardWaterTolerant = reqHardWaterTolerant; }

    public boolean isToxicTo(String animal) {
        ToxicityInfo info = toxicity.get(animal);
        return info != null && info.toxic();
    }

    public String getToxicAnimals() {
        return toxicity.entrySet().stream()
                .filter(e -> e.getValue().toxic())
                .map(Map.Entry::getKey)
                .reduce((a, b) -> a + "," + b)
                .orElse("");
    }

    public String getMaxToxicitySeverity() {
        int max = 0;
        for (ToxicityInfo info : toxicity.values()) {
            if (!info.toxic()) continue;
            int level = switch (info.severity() != null ? info.severity() : "") {
                case "fatal" -> 4;
                case "severe" -> 3;
                case "moderate" -> 2;
                case "mild" -> 1;
                default -> 0;
            };
            max = Math.max(max, level);
        }
        return switch (max) {
            case 4 -> "fatal";
            case 3 -> "severe";
            case 2 -> "moderate";
            case 1 -> "mild";
            default -> "";
        };
    }
}
