package com.gardenplanner.rightmove;

import com.gardenplanner.model.PropertyData;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RightmovePageParser {

    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();
    private static final Pattern PROPERTY_ID_PATTERN = Pattern.compile("/properties/(\\d+)");

    public static String extractPropertyId(String url) {
        Matcher matcher = PROPERTY_ID_PATTERN.matcher(url);
        if (!matcher.find()) {
            throw new IllegalArgumentException("Could not extract property ID from URL: " + url);
        }
        return matcher.group(1);
    }

    public static JsonObject fetchPageModel(String propertyId) throws IOException, InterruptedException {
        String url = "https://www.rightmove.co.uk/properties/" + propertyId;

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
                .GET()
                .build();

        HttpResponse<String> response = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() != 200) {
            throw new IOException("Rightmove returned HTTP " + response.statusCode());
        }

        String html = response.body();
        int modelIdx = html.indexOf("PAGE_MODEL");
        if (modelIdx == -1) {
            throw new IOException("Could not find PAGE_MODEL in page source");
        }

        int jsonStart = html.indexOf('{', modelIdx);
        if (jsonStart == -1) {
            throw new IOException("Could not find PAGE_MODEL JSON start");
        }

        int jsonEnd = findMatchingBrace(html, jsonStart);
        String rawJson = html.substring(jsonStart, jsonEnd + 1);

        JsonObject wrapper = JsonParser.parseString(rawJson).getAsJsonObject();

        if (wrapper.has("data") && wrapper.get("data").isJsonPrimitive()) {
            JsonArray dataArray = JsonParser.parseString(wrapper.get("data").getAsString()).getAsJsonArray();
            return resolvePackedModel(dataArray);
        }

        return wrapper;
    }

    private static int findMatchingBrace(String html, int start) {
        int depth = 0;
        boolean inString = false;
        boolean escape = false;

        for (int i = start; i < html.length(); i++) {
            char c = html.charAt(i);
            if (escape) {
                escape = false;
                continue;
            }
            if (c == '\\' && inString) {
                escape = true;
                continue;
            }
            if (c == '"') {
                inString = !inString;
                continue;
            }
            if (!inString) {
                if (c == '{') depth++;
                else if (c == '}') {
                    depth--;
                    if (depth == 0) return i;
                }
            }
        }
        throw new IllegalStateException("Unmatched brace in PAGE_MODEL JSON");
    }

    private static JsonObject resolvePackedModel(JsonArray dataArray) {
        JsonObject root = dataArray.get(0).getAsJsonObject();
        JsonObject resolved = new JsonObject();

        int propertyDataIdx = root.get("propertyData").getAsInt();
        JsonObject propertyData = resolveObject(dataArray, propertyDataIdx, 0);
        copyAll(propertyData, resolved);

        int analyticsInfoIdx = root.get("analyticsInfo").getAsInt();
        JsonObject analyticsInfo = resolveObject(dataArray, analyticsInfoIdx, 0);
        JsonObject resolvedAnalytics = new JsonObject();
        resolvedAnalytics.add("analyticsProperty",
                resolveObject(dataArray, dataArray.get(analyticsInfoIdx).getAsJsonObject()
                        .get("analyticsProperty").getAsInt(), 0));
        JsonObject wrappedAnalytics = new JsonObject();
        wrappedAnalytics.add("analyticsInfo", resolvedAnalytics);
        copyAll(wrappedAnalytics, resolved);

        return resolved;
    }

    private static JsonObject resolveObject(JsonArray dataArray, int index, int depth) {
        if (depth > 5) return new JsonObject();
        JsonElement element = dataArray.get(index);
        if (!element.isJsonObject()) return new JsonObject();

        JsonObject source = element.getAsJsonObject();
        JsonObject resolved = new JsonObject();

        for (var entry : source.entrySet()) {
            String key = entry.getKey();
            JsonElement value = entry.getValue();

            if (value.isJsonPrimitive() && value.getAsJsonPrimitive().isNumber()) {
                int refIdx = value.getAsInt();
                if (refIdx >= 0 && refIdx < dataArray.size()) {
                    JsonElement referenced = dataArray.get(refIdx);
                    if (referenced.isJsonObject()) {
                        resolved.add(key, resolveObject(dataArray, refIdx, depth + 1));
                    } else if (referenced.isJsonArray()) {
                        resolved.add(key, resolveArray(dataArray, refIdx, depth + 1));
                    } else {
                        resolved.add(key, referenced);
                    }
                } else {
                    resolved.add(key, value);
                }
            } else if (value.isJsonNull()) {
                resolved.add(key, value);
            } else {
                resolved.add(key, value);
            }
        }
        return resolved;
    }

    private static JsonArray resolveArray(JsonArray dataArray, int index, int depth) {
        if (depth > 5) return new JsonArray();
        JsonElement element = dataArray.get(index);
        if (!element.isJsonArray()) return new JsonArray();

        JsonArray source = element.getAsJsonArray();
        JsonArray resolved = new JsonArray();

        for (JsonElement item : source) {
            if (item.isJsonPrimitive() && item.getAsJsonPrimitive().isNumber()) {
                int refIdx = item.getAsInt();
                if (refIdx >= 0 && refIdx < dataArray.size()) {
                    JsonElement referenced = dataArray.get(refIdx);
                    if (referenced.isJsonObject()) {
                        resolved.add(resolveObject(dataArray, refIdx, depth + 1));
                    } else if (referenced.isJsonArray()) {
                        resolved.add(resolveArray(dataArray, refIdx, depth + 1));
                    } else {
                        resolved.add(referenced);
                    }
                } else {
                    resolved.add(item);
                }
            } else {
                resolved.add(item);
            }
        }
        return resolved;
    }

    private static void copyAll(JsonObject source, JsonObject target) {
        for (var entry : source.entrySet()) {
            target.add(entry.getKey(), entry.getValue());
        }
    }

    public static PropertyData parseProperty(String propertyId, JsonObject pageModel) {
        double lat;
        double lon;
        String outcode;
        String incode;
        String displayAddress;

        if (pageModel.has("analyticsInfo")) {
            JsonObject analyticsProperty = pageModel.getAsJsonObject("analyticsInfo")
                    .getAsJsonObject("analyticsProperty");

            lat = analyticsProperty.get("latitude").getAsDouble();
            lon = analyticsProperty.get("longitude").getAsDouble();

            if (analyticsProperty.has("postcode")) {
                String fullPostcode = analyticsProperty.get("postcode").getAsString();
                String[] parts = fullPostcode.trim().split("\\s+");
                outcode = parts[0];
                incode = parts.length > 1 ? parts[1] : "";
            } else {
                outcode = "";
                incode = "";
            }
        } else {
            lat = pageModel.has("location") ? pageModel.getAsJsonObject("location").get("latitude").getAsDouble() : 0;
            lon = pageModel.has("location") ? pageModel.getAsJsonObject("location").get("longitude").getAsDouble() : 0;
            outcode = "";
            incode = "";
        }

        if (pageModel.has("address")) {
            JsonObject address = pageModel.getAsJsonObject("address");
            if (address.has("outcode")) outcode = address.get("outcode").getAsString();
            if (address.has("incode")) incode = address.get("incode").getAsString();
            displayAddress = address.has("displayAddress")
                    ? address.get("displayAddress").getAsString()
                        .replaceAll("\\r\\n|\\r|\\n", ", ")
                        .replaceAll(",\\s*,", ",")
                        .replaceAll("^,\\s*|,\\s*$", "")
                    : "Unknown address";
        } else {
            displayAddress = "Unknown address";
        }

        String postcode = (outcode + " " + incode).trim();

        boolean hasGarden = detectGarden(pageModel);

        int bedrooms = 0;
        if (pageModel.has("bedrooms") && pageModel.get("bedrooms").isJsonPrimitive()) {
            bedrooms = pageModel.get("bedrooms").getAsInt();
        } else if (pageModel.has("analyticsInfo")) {
            JsonObject ap = pageModel.getAsJsonObject("analyticsInfo").getAsJsonObject("analyticsProperty");
            if (ap.has("beds")) bedrooms = ap.get("beds").getAsInt();
        }

        String propertyType = "Unknown";
        if (pageModel.has("propertySubType") && pageModel.get("propertySubType").isJsonPrimitive()) {
            propertyType = pageModel.get("propertySubType").getAsString();
        } else if (pageModel.has("analyticsInfo")) {
            JsonObject ap = pageModel.getAsJsonObject("analyticsInfo").getAsJsonObject("analyticsProperty");
            if (ap.has("propertySubType")) propertyType = ap.get("propertySubType").getAsString();
        }

        String imageUrl = extractFirstImage(pageModel);

        return new PropertyData(propertyId, lat, lon, outcode, incode,
                postcode, displayAddress, hasGarden, bedrooms, propertyType, imageUrl);
    }

    private static String extractFirstImage(JsonObject pageModel) {
        if (pageModel.has("images") && pageModel.get("images").isJsonArray()) {
            JsonArray images = pageModel.getAsJsonArray("images");
            if (!images.isEmpty()) {
                JsonElement first = images.get(0);
                if (first.isJsonObject()) {
                    JsonObject img = first.getAsJsonObject();
                    if (img.has("url") && img.get("url").isJsonPrimitive()) {
                        return img.get("url").getAsString();
                    }
                    if (img.has("srcUrl") && img.get("srcUrl").isJsonPrimitive()) {
                        return img.get("srcUrl").getAsString();
                    }
                } else if (first.isJsonPrimitive()) {
                    return first.getAsString();
                }
            }
        }
        if (pageModel.has("photos") && pageModel.get("photos").isJsonArray()) {
            JsonArray photos = pageModel.getAsJsonArray("photos");
            if (!photos.isEmpty()) {
                JsonElement first = photos.get(0);
                if (first.isJsonObject()) {
                    JsonObject img = first.getAsJsonObject();
                    if (img.has("url") && img.get("url").isJsonPrimitive()) {
                        return img.get("url").getAsString();
                    }
                }
            }
        }
        return null;
    }

    private static boolean detectGarden(JsonObject pageModel) {
        if (pageModel.has("keyFeatures") && pageModel.get("keyFeatures").isJsonArray()) {
            JsonArray features = pageModel.getAsJsonArray("keyFeatures");
            for (JsonElement feature : features) {
                if (feature.isJsonPrimitive() && feature.getAsString().toLowerCase().contains("garden")) {
                    return true;
                }
            }
        }
        if (pageModel.has("text") && pageModel.get("text").isJsonObject()) {
            JsonObject text = pageModel.getAsJsonObject("text");
            if (text.has("description") && text.get("description").isJsonPrimitive()) {
                String desc = text.get("description").getAsString().toLowerCase();
                if (desc.contains("garden")) {
                    return true;
                }
            }
        }
        return false;
    }
}
