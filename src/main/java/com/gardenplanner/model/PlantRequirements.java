package com.gardenplanner.model;

public class PlantRequirements {

    private int plantId;
    private String minHardiness;
    private String soilTypes;
    private String soilPh;
    private String drainage;
    private Double minSunHours;
    private String sunPreference;
    private Double minRainfallMm;
    private Double maxRainfallMm;
    private boolean pollutionTolerant;
    private boolean hardWaterTolerant;

    public int getPlantId() { return plantId; }
    public void setPlantId(int plantId) { this.plantId = plantId; }

    public String getMinHardiness() { return minHardiness; }
    public void setMinHardiness(String minHardiness) { this.minHardiness = minHardiness; }

    public String getSoilTypes() { return soilTypes; }
    public void setSoilTypes(String soilTypes) { this.soilTypes = soilTypes; }

    public String getSoilPh() { return soilPh; }
    public void setSoilPh(String soilPh) { this.soilPh = soilPh; }

    public String getDrainage() { return drainage; }
    public void setDrainage(String drainage) { this.drainage = drainage; }

    public Double getMinSunHours() { return minSunHours; }
    public void setMinSunHours(Double minSunHours) { this.minSunHours = minSunHours; }

    public String getSunPreference() { return sunPreference; }
    public void setSunPreference(String sunPreference) { this.sunPreference = sunPreference; }

    public Double getMinRainfallMm() { return minRainfallMm; }
    public void setMinRainfallMm(Double minRainfallMm) { this.minRainfallMm = minRainfallMm; }

    public Double getMaxRainfallMm() { return maxRainfallMm; }
    public void setMaxRainfallMm(Double maxRainfallMm) { this.maxRainfallMm = maxRainfallMm; }

    public boolean isPollutionTolerant() { return pollutionTolerant; }
    public void setPollutionTolerant(boolean pollutionTolerant) { this.pollutionTolerant = pollutionTolerant; }

    public boolean isHardWaterTolerant() { return hardWaterTolerant; }
    public void setHardWaterTolerant(boolean hardWaterTolerant) { this.hardWaterTolerant = hardWaterTolerant; }
}
