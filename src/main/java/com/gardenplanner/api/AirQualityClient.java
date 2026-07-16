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

@Component
public class AirQualityClient {

    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();

    public record AirQualityData(int europeanAqi, String description) {}

    public AirQualityData getAirQuality(double latitude, double longitude)
            throws IOException, InterruptedException {

        String url = String.format(
                "https://air-quality-api.open-meteo.com/v1/air-quality"
                        + "?latitude=%f&longitude=%f"
                        + "&hourly=european_aqi",
                latitude, longitude
        );

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build();

        HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() != 200) {
            return new AirQualityData(2, "Fair");
        }

        try {
            JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();
            JsonArray aqiArray = json.getAsJsonObject("hourly").getAsJsonArray("european_aqi");

            double sum = 0;
            int count = 0;
            for (JsonElement el : aqiArray) {
                if (!el.isJsonNull()) {
                    sum += el.getAsDouble();
                    count++;
                }
            }

            int avgAqi = count > 0 ? (int) Math.round(sum / count) : 25;
            return new AirQualityData(avgAqi, describeAqi(avgAqi));
        } catch (Exception e) {
            return new AirQualityData(2, "Fair");
        }
    }

    private String describeAqi(int aqi) {
        if (aqi <= 20) return "Good";
        if (aqi <= 40) return "Fair";
        if (aqi <= 60) return "Moderate";
        if (aqi <= 80) return "Poor";
        return "Very Poor";
    }
}
