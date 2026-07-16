package com.gardenplanner.api;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Component
public class SoilClient {

    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();
    private static final String BASE_URL =
            "https://www.landis.org.uk/arcgis/rest/services/UKSoilObservatory/Soilscapes_Cranfield/MapServer/identify";

    public record SoilData(String soilType, String drainage, String phRange) {}

    public SoilData getSoilData(double latitude, double longitude) throws IOException, InterruptedException {
        double buffer = 0.01;
        String mapExtent = String.format("%f,%f,%f,%f",
                longitude - buffer, latitude - buffer,
                longitude + buffer, latitude + buffer);

        String url = BASE_URL + "?" + String.join("&",
                "geometry=" + longitude + "," + latitude,
                "geometryType=esriGeometryPoint",
                "sr=4326",
                "layers=all:0",
                "tolerance=1",
                "mapExtent=" + URLEncoder.encode(mapExtent, StandardCharsets.UTF_8),
                "imageDisplay=800,600,96",
                "returnGeometry=false",
                "f=json"
        );

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build();

        HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() != 200) {
            return fallbackSoilData();
        }

        try {
            JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();
            JsonArray results = json.getAsJsonArray("results");
            if (results == null || results.isEmpty()) {
                return fallbackSoilData();
            }

            JsonObject attributes = results.get(0).getAsJsonObject().getAsJsonObject("attributes");
            String soilscapeDescription = attributes.has("SOILSCAPE")
                    ? attributes.get("SOILSCAPE").getAsString()
                    : "";

            return parseSoilscapeDescription(soilscapeDescription);
        } catch (Exception e) {
            return fallbackSoilData();
        }
    }

    private SoilData parseSoilscapeDescription(String description) {
        String lower = description.toLowerCase();

        String soilType = deriveSoilType(lower);
        String drainage = deriveDrainage(lower);
        String phRange = derivePhRange(lower);

        return new SoilData(soilType, drainage, phRange);
    }

    private String deriveSoilType(String desc) {
        if (desc.contains("clay")) return "clay";
        if (desc.contains("peat")) return "peat";
        if (desc.contains("chalk")) return "chalk";
        if (desc.contains("sand")) return "sand";
        if (desc.contains("loam")) return "loam";
        return "loam";
    }

    private String deriveDrainage(String desc) {
        if (desc.contains("freely draining")) return "free";
        if (desc.contains("impeded")) return "impeded";
        if (desc.contains("waterlogged") || desc.contains("wet")) return "waterlogged";
        if (desc.contains("slightly impeded")) return "impeded";
        return "moist";
    }

    private String derivePhRange(String desc) {
        if (desc.contains("acid")) return "acid";
        if (desc.contains("chalk") || desc.contains("calcareous") || desc.contains("lime")) return "alkaline";
        return "neutral";
    }

    private SoilData fallbackSoilData() {
        return new SoilData("loam", "moist", "neutral");
    }
}
