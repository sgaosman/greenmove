package com.gardenplanner.service;

import com.gardenplanner.api.AirQualityClient;
import com.gardenplanner.api.SoilClient;
import com.gardenplanner.api.WaterQualityClient;
import com.gardenplanner.api.WeatherClient;
import com.gardenplanner.model.PropertyData;
import com.gardenplanner.model.SiteProfile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.concurrent.CompletableFuture;

@Service
public class EnvironmentService {

    private static final Logger log = LoggerFactory.getLogger(EnvironmentService.class);

    private final SoilClient soilClient;
    private final WeatherClient weatherClient;
    private final AirQualityClient airQualityClient;
    private final WaterQualityClient waterQualityClient;

    public EnvironmentService(SoilClient soilClient, WeatherClient weatherClient,
                              AirQualityClient airQualityClient, WaterQualityClient waterQualityClient) {
        this.soilClient = soilClient;
        this.weatherClient = weatherClient;
        this.airQualityClient = airQualityClient;
        this.waterQualityClient = waterQualityClient;
    }

    public SiteProfile buildProfile(PropertyData property) {
        double lat = property.getLatitude();
        double lon = property.getLongitude();

        var soilFuture = CompletableFuture.supplyAsync(() -> {
            try {
                return soilClient.getSoilData(lat, lon);
            } catch (Exception e) {
                log.warn("Soil API failed, using defaults", e);
                return new SoilClient.SoilData("loam", "moist", "neutral");
            }
        });

        var weatherFuture = CompletableFuture.supplyAsync(() -> {
            try {
                return weatherClient.getHistoricalWeather(lat, lon);
            } catch (Exception e) {
                log.warn("Weather API failed, using defaults", e);
                return new WeatherClient.WeatherData(750.0, 1400.0, -5.0);
            }
        });

        var airFuture = CompletableFuture.supplyAsync(() -> {
            try {
                return airQualityClient.getAirQuality(lat, lon);
            } catch (Exception e) {
                log.warn("Air quality API failed, using defaults", e);
                return new AirQualityClient.AirQualityData(25, "Fair");
            }
        });

        var waterFuture = CompletableFuture.supplyAsync(() -> {
            try {
                return waterQualityClient.getWaterQuality(property.getPostcode());
            } catch (Exception e) {
                log.warn("Water quality API failed, using defaults", e);
                return new WaterQualityClient.WaterData(170.0);
            }
        });

        CompletableFuture.allOf(soilFuture, weatherFuture, airFuture, waterFuture).join();

        SoilClient.SoilData soil = soilFuture.join();
        WeatherClient.WeatherData weather = weatherFuture.join();
        AirQualityClient.AirQualityData air = airFuture.join();
        WaterQualityClient.WaterData water = waterFuture.join();

        SiteProfile profile = new SiteProfile();
        profile.setPostcode(property.getPostcode());
        profile.setLatitude(lat);
        profile.setLongitude(lon);
        profile.setSoilType(soil.soilType());
        profile.setSoilDrainage(soil.drainage());
        profile.setSoilPhRange(soil.phRange());
        profile.setAvgAnnualRainfall(weather.avgAnnualRainfallMm());
        profile.setAvgSunshineHours(weather.avgSunshineHours());
        profile.setWinterMinTemp(weather.winterMinTemp());
        profile.setRhsHardinessZone(getHardinessZone(weather.winterMinTemp()));
        profile.setAirQualityIndex(air.europeanAqi());
        profile.setAirQualityDescription(air.description());
        profile.setWaterHardnessPpm(water.hardnessPpm());

        return profile;
    }

    public static String getHardinessZone(double winterMinCelsius) {
        if (winterMinCelsius > 15)  return "H1a";
        if (winterMinCelsius > 10)  return "H1b";
        if (winterMinCelsius > 5)   return "H1c";
        if (winterMinCelsius > 1)   return "H2";
        if (winterMinCelsius > -5)  return "H3";
        if (winterMinCelsius > -10) return "H4";
        if (winterMinCelsius > -15) return "H5";
        if (winterMinCelsius > -20) return "H6";
        return "H7";
    }
}
