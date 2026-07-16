package com.gardenplanner.api;

import com.gardenplanner.model.RetailerLink;
import com.gardenplanner.model.ShoppingResult;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import com.gardenplanner.db.Database;

@Service
public class ShoppingClient {

    private static final Logger log = LoggerFactory.getLogger(ShoppingClient.class);
    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();
    private static final long CACHE_TTL_HOURS = 24;

    @Value("${serpapi.api.key:}")
    private String apiKey;

    private final Database database;

    public ShoppingClient(Database database) {
        this.database = database;
    }

    public boolean isApiAvailable() {
        return apiKey != null && !apiKey.isBlank();
    }

    public List<ShoppingResult> searchGoogleShopping(String query) {
        String cacheKey = "google_shopping:" + query;
        List<ShoppingResult> cached = getFromCache(cacheKey);
        if (cached != null) return cached;

        try {
            String url = "https://serpapi.com/search.json"
                    + "?engine=google_shopping"
                    + "&q=" + URLEncoder.encode(query, StandardCharsets.UTF_8)
                    + "&gl=uk&hl=en&google_domain=google.co.uk&num=8"
                    + "&api_key=" + apiKey;

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .GET()
                    .build();

            HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 429 || response.statusCode() == 402) {
                log.warn("SerpApi quota exhausted (HTTP {}). Google Shopping results will be unavailable until the quota resets.", response.statusCode());
                return List.of();
            }

            if (response.statusCode() != 200) {
                log.warn("SerpApi Google Shopping returned HTTP {}. Results may be less reliable.", response.statusCode());
                return List.of();
            }

            JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();
            JsonArray results = json.has("shopping_results") ? json.getAsJsonArray("shopping_results") : null;
            if (results == null) return List.of();

            List<ShoppingResult> items = new ArrayList<>();
            for (JsonElement el : results) {
                JsonObject item = el.getAsJsonObject();
                String link = getStr(item, "product_link");
                if (link == null) link = getStr(item, "link");
                String badge = getStr(item, "tag");
                if (badge == null) badge = getStr(item, "badge");
                items.add(new ShoppingResult(
                        getStr(item, "title"),
                        link,
                        getStr(item, "source"),
                        getStr(item, "source_icon"),
                        getStr(item, "price"),
                        getDouble(item, "extracted_price"),
                        getStr(item, "old_price"),
                        getStr(item, "thumbnail"),
                        getDouble(item, "rating"),
                        getInt(item, "reviews"),
                        getStr(item, "delivery"),
                        null,
                        badge,
                        "google_shopping"
                ));
            }

            putToCache(cacheKey, "google_shopping", response.body());
            return items;

        } catch (Exception e) {
            log.warn("SerpApi Google Shopping call failed: {}. Falling back to retailer links only.", e.getMessage());
            return List.of();
        }
    }

    public List<ShoppingResult> searchEbay(String query) {
        String cacheKey = "ebay:" + query;
        List<ShoppingResult> cached = getFromCache(cacheKey);
        if (cached != null) return cached;

        try {
            String url = "https://serpapi.com/search.json"
                    + "?engine=ebay"
                    + "&ebay_domain=ebay.co.uk"
                    + "&_nkw=" + URLEncoder.encode(query, StandardCharsets.UTF_8)
                    + "&_num=6"
                    + "&api_key=" + apiKey;

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .GET()
                    .build();

            HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 429 || response.statusCode() == 402) {
                log.warn("SerpApi quota exhausted (HTTP {}). eBay results will be unavailable until the quota resets.", response.statusCode());
                return List.of();
            }

            if (response.statusCode() != 200) {
                log.warn("SerpApi eBay returned HTTP {}. Results may be less reliable.", response.statusCode());
                return List.of();
            }

            JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();
            JsonArray results = json.has("organic_results") ? json.getAsJsonArray("organic_results") : null;
            if (results == null) return List.of();

            List<ShoppingResult> items = new ArrayList<>();
            for (JsonElement el : results) {
                JsonObject item = el.getAsJsonObject();

                String price = null;
                Double extractedPrice = null;
                if (item.has("price") && item.get("price").isJsonObject()) {
                    JsonObject priceObj = item.getAsJsonObject("price");
                    price = getStr(priceObj, "raw");
                    extractedPrice = getDouble(priceObj, "extracted");
                }

                Double rating = null;
                Integer reviewCount = null;
                if (item.has("reviews") && item.get("reviews").isJsonObject()) {
                    JsonObject reviewsObj = item.getAsJsonObject("reviews");
                    rating = getDouble(reviewsObj, "rating");
                    reviewCount = getInt(reviewsObj, "count");
                }

                items.add(new ShoppingResult(
                        getStr(item, "title"),
                        getStr(item, "link"),
                        "eBay",
                        null,
                        price,
                        extractedPrice,
                        null,
                        getStr(item, "image"),
                        rating,
                        reviewCount,
                        getStr(item, "shipping"),
                        getStr(item, "condition"),
                        null,
                        "ebay"
                ));
            }

            putToCache(cacheKey, "ebay", response.body());
            return items;

        } catch (Exception e) {
            log.warn("SerpApi eBay call failed: {}. Falling back to retailer links only.", e.getMessage());
            return List.of();
        }
    }

    public static List<RetailerLink> buildRetailerLinks(String plantName) {
        String encoded = URLEncoder.encode(plantName, StandardCharsets.UTF_8);
        return List.of(
                new RetailerLink("Thompson & Morgan", "thompson-morgan.com",
                        "https://www.thompson-morgan.com/search?q=" + encoded,
                        "UK's oldest seed merchant. Seeds, plants, bulbs."),
                new RetailerLink("Crocus", "crocus.co.uk",
                        "https://www.crocus.co.uk/search/_/" + encoded + "/",
                        "Award-winning online garden centre. Potted plants, trees, shrubs."),
                new RetailerLink("Suttons Seeds", "suttons.co.uk",
                        "https://www.suttons.co.uk/search?q=" + encoded,
                        "Seeds, plug plants, and growing kits since 1806."),
                new RetailerLink("B&Q", "diy.com",
                        "https://www.diy.com/search?term=" + encoded,
                        "Garden centre and DIY. Compost, pots, tools, and plants."),
                new RetailerLink("RHS Plants", "rhsplants.co.uk",
                        "https://www.rhsplants.co.uk/search?q=" + encoded,
                        "Royal Horticultural Society shop. Curated plant selection."),
                new RetailerLink("Amazon", "amazon.co.uk",
                        "https://www.amazon.co.uk/s?k=" + encoded + "+seeds+plants",
                        "Wide range, fast delivery. Seeds, kits, and garden supplies."),
                new RetailerLink("Google Shopping", "google.co.uk",
                        "https://www.google.co.uk/search?q=buy+" + encoded + "&tbm=shop",
                        "Compare prices across hundreds of retailers.")
        );
    }

    private List<ShoppingResult> getFromCache(String cacheKey) {
        try (Connection conn = database.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT results_json, cached_at, engine FROM shopping_cache WHERE query_key = ?")) {
            ps.setString(1, cacheKey);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Instant cachedAt = Instant.parse(rs.getString("cached_at"));
                    if (cachedAt.plus(CACHE_TTL_HOURS, ChronoUnit.HOURS).isAfter(Instant.now())) {
                        String engine = rs.getString("engine");
                        String json = rs.getString("results_json");
                        return parseFromCachedJson(json, engine);
                    }
                }
            }
        } catch (Exception e) {
            log.debug("Cache lookup failed for {}: {}", cacheKey, e.getMessage());
        }
        return null;
    }

    private void putToCache(String cacheKey, String engine, String resultsJson) {
        try (Connection conn = database.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT OR REPLACE INTO shopping_cache (query_key, engine, results_json, cached_at) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, cacheKey);
            ps.setString(2, engine);
            ps.setString(3, resultsJson);
            ps.setString(4, Instant.now().toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            log.debug("Cache write failed for {}: {}", cacheKey, e.getMessage());
        }
    }

    private List<ShoppingResult> parseFromCachedJson(String json, String engine) {
        JsonObject root = JsonParser.parseString(json).getAsJsonObject();
        if ("google_shopping".equals(engine)) {
            JsonArray results = root.has("shopping_results") ? root.getAsJsonArray("shopping_results") : null;
            if (results == null) return List.of();
            List<ShoppingResult> items = new ArrayList<>();
            for (JsonElement el : results) {
                JsonObject item = el.getAsJsonObject();
                String link = getStr(item, "product_link");
                if (link == null) link = getStr(item, "link");
                String badge = getStr(item, "tag");
                if (badge == null) badge = getStr(item, "badge");
                items.add(new ShoppingResult(
                        getStr(item, "title"), link, getStr(item, "source"), getStr(item, "source_icon"),
                        getStr(item, "price"), getDouble(item, "extracted_price"), getStr(item, "old_price"),
                        getStr(item, "thumbnail"), getDouble(item, "rating"), getInt(item, "reviews"),
                        getStr(item, "delivery"), null, badge, "google_shopping"
                ));
            }
            return items;
        } else {
            JsonArray results = root.has("organic_results") ? root.getAsJsonArray("organic_results") : null;
            if (results == null) return List.of();
            List<ShoppingResult> items = new ArrayList<>();
            for (JsonElement el : results) {
                JsonObject item = el.getAsJsonObject();
                String price = null;
                Double extractedPrice = null;
                if (item.has("price") && item.get("price").isJsonObject()) {
                    JsonObject priceObj = item.getAsJsonObject("price");
                    price = getStr(priceObj, "raw");
                    extractedPrice = getDouble(priceObj, "extracted");
                }
                Double rating = null;
                Integer reviewCount = null;
                if (item.has("reviews") && item.get("reviews").isJsonObject()) {
                    JsonObject reviewsObj = item.getAsJsonObject("reviews");
                    rating = getDouble(reviewsObj, "rating");
                    reviewCount = getInt(reviewsObj, "count");
                }
                items.add(new ShoppingResult(
                        getStr(item, "title"), getStr(item, "link"), "eBay", null,
                        price, extractedPrice, null, getStr(item, "image"),
                        rating, reviewCount, getStr(item, "shipping"), getStr(item, "condition"),
                        null, "ebay"
                ));
            }
            return items;
        }
    }

    private static String getStr(JsonObject obj, String key) {
        return obj.has(key) && !obj.get(key).isJsonNull() ? obj.get(key).getAsString() : null;
    }

    private static Double getDouble(JsonObject obj, String key) {
        try {
            return obj.has(key) && !obj.get(key).isJsonNull() ? obj.get(key).getAsDouble() : null;
        } catch (Exception e) {
            return null;
        }
    }

    private static Integer getInt(JsonObject obj, String key) {
        try {
            return obj.has(key) && !obj.get(key).isJsonNull() ? obj.get(key).getAsInt() : null;
        } catch (Exception e) {
            return null;
        }
    }
}
