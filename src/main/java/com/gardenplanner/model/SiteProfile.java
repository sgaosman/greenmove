package com.gardenplanner.model;

public class SiteProfile {

    private String postcode;
    private double latitude;
    private double longitude;
    private String soilType;
    private String soilDrainage;
    private String soilPhRange;
    private double avgAnnualRainfall;
    private double avgSunshineHours;
    private double winterMinTemp;
    private String rhsHardinessZone;
    private int airQualityIndex;
    private String airQualityDescription;
    private double waterHardnessPpm;

    public String getPostcode() { return postcode; }
    public void setPostcode(String postcode) { this.postcode = postcode; }

    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude; }

    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude; }

    public String getSoilType() { return soilType; }
    public void setSoilType(String soilType) { this.soilType = soilType; }

    public String getSoilDrainage() { return soilDrainage; }
    public void setSoilDrainage(String soilDrainage) { this.soilDrainage = soilDrainage; }

    public String getSoilPhRange() { return soilPhRange; }
    public void setSoilPhRange(String soilPhRange) { this.soilPhRange = soilPhRange; }

    public double getAvgAnnualRainfall() { return avgAnnualRainfall; }
    public void setAvgAnnualRainfall(double avgAnnualRainfall) { this.avgAnnualRainfall = avgAnnualRainfall; }

    public double getAvgSunshineHours() { return avgSunshineHours; }
    public void setAvgSunshineHours(double avgSunshineHours) { this.avgSunshineHours = avgSunshineHours; }

    public double getWinterMinTemp() { return winterMinTemp; }
    public void setWinterMinTemp(double winterMinTemp) { this.winterMinTemp = winterMinTemp; }

    public String getRhsHardinessZone() { return rhsHardinessZone; }
    public void setRhsHardinessZone(String rhsHardinessZone) { this.rhsHardinessZone = rhsHardinessZone; }

    public int getAirQualityIndex() { return airQualityIndex; }
    public void setAirQualityIndex(int airQualityIndex) { this.airQualityIndex = airQualityIndex; }

    public String getAirQualityDescription() { return airQualityDescription; }
    public void setAirQualityDescription(String airQualityDescription) { this.airQualityDescription = airQualityDescription; }

    public double getWaterHardnessPpm() { return waterHardnessPpm; }
    public void setWaterHardnessPpm(double waterHardnessPpm) { this.waterHardnessPpm = waterHardnessPpm; }
}
