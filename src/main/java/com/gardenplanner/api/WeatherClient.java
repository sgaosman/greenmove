package com.gardenplanner.api;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDate;

@Component
public class WeatherClient {

    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();

    public record WeatherData(
            double avgAnnualRainfallMm,
            double avgSunshineHours,
            double winterMinTemp
    ) {}

    public WeatherData getHistoricalWeather(double latitude, double longitude)
            throws IOException, InterruptedException {

        LocalDate endDate = LocalDate.now().minusMonths(1);
        LocalDate startDate = endDate.minusYears(4);

        String url = String.format(
                "https://archive-api.open-meteo.com/v1/era5"
                        + "?latitude=%f&longitude=%f"
                        + "&start_date=%s&end_date=%s"
                        + "&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,sunshine_duration"
                        + "&timezone=Europe%%2FLondon",
                latitude, longitude, startDate, endDate
        );

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build();

        HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() != 200) {
            throw new IOException("Open-Meteo historical API returned HTTP " + response.statusCode());
        }

        JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();
        JsonObject daily = json.getAsJsonObject("daily");

        JsonArray precipArray = daily.getAsJsonArray("precipitation_sum");
        JsonArray sunshineArray = daily.getAsJsonArray("sunshine_duration");
        JsonArray tempMinArray = daily.getAsJsonArray("temperature_2m_min");

        double totalPrecip = 0;
        int precipDays = 0;
        for (JsonElement el : precipArray) {
            if (!el.isJsonNull()) {
                totalPrecip += el.getAsDouble();
                precipDays++;
            }
        }

        double totalSunshineSeconds = 0;
        int sunshineDays = 0;
        for (JsonElement el : sunshineArray) {
            if (!el.isJsonNull()) {
                totalSunshineSeconds += el.getAsDouble();
                sunshineDays++;
            }
        }

        double winterMin = Double.MAX_VALUE;
        for (JsonElement el : tempMinArray) {
            if (!el.isJsonNull()) {
                double temp = el.getAsDouble();
                if (temp < winterMin) {
                    winterMin = temp;
                }
            }
        }

        int years = Math.max(1, precipDays / 365);
        double avgAnnualRainfall = totalPrecip / years;
        double avgSunshineHours = (totalSunshineSeconds / 3600.0) / years;

        return new WeatherData(
                Math.round(avgAnnualRainfall * 10.0) / 10.0,
                Math.round(avgSunshineHours * 10.0) / 10.0,
                Math.round(winterMin * 10.0) / 10.0
        );
    }
}
