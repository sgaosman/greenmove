package com.gardenplanner.api;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Component
public class WaterQualityClient {

    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();

    @Value("${mytapwater.api-key:}")
    private String apiKey;

    public record WaterData(double hardnessPpm) {}

    public WaterData getWaterQuality(String postcode) throws IOException, InterruptedException {
        if (apiKey == null || apiKey.isBlank()) {
            return estimateHardness(postcode);
        }

        String cleanPostcode = postcode.replaceAll("\\s+", "");
        String url = "https://api.mytapwater.co.uk/v1/quality?postcode=" + cleanPostcode;

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Authorization", "Bearer " + apiKey)
                .GET()
                .build();

        HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() != 200) {
            return estimateHardness(postcode);
        }

        try {
            JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();
            double hardness = json.has("hardness")
                    ? json.get("hardness").getAsDouble()
                    : 200.0;
            return new WaterData(hardness);
        } catch (Exception e) {
            return estimateHardness(postcode);
        }
    }

    private WaterData estimateHardness(String postcode) {
        String upper = postcode.toUpperCase().trim();
        if (upper.startsWith("SE") || upper.startsWith("SW") || upper.startsWith("E")
                || upper.startsWith("W") || upper.startsWith("EC") || upper.startsWith("WC")
                || upper.startsWith("N") || upper.startsWith("NW")
                || upper.startsWith("CR") || upper.startsWith("BR")
                || upper.startsWith("DA") || upper.startsWith("CT")
                || upper.startsWith("ME") || upper.startsWith("TN")
                || upper.startsWith("BN") || upper.startsWith("RH")
                || upper.startsWith("KT") || upper.startsWith("SM")
                || upper.startsWith("SL") || upper.startsWith("HP")
                || upper.startsWith("LU") || upper.startsWith("MK")
                || upper.startsWith("OX") || upper.startsWith("CB")) {
            return new WaterData(280.0);
        }
        if (upper.startsWith("M") || upper.startsWith("L")
                || upper.startsWith("WA") || upper.startsWith("CW")
                || upper.startsWith("CH") || upper.startsWith("WN")
                || upper.startsWith("BL") || upper.startsWith("OL")
                || upper.startsWith("SK")) {
            return new WaterData(40.0);
        }
        if (upper.startsWith("EH") || upper.startsWith("G")
                || upper.startsWith("DD") || upper.startsWith("AB")
                || upper.startsWith("IV") || upper.startsWith("PH")
                || upper.startsWith("FK") || upper.startsWith("KY")) {
            return new WaterData(50.0);
        }
        return new WaterData(170.0);
    }
}
