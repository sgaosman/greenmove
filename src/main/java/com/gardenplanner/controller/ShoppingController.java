package com.gardenplanner.controller;

import com.gardenplanner.api.ShoppingClient;
import com.gardenplanner.db.Database;
import com.gardenplanner.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
public class ShoppingController {

    private static final Logger log = LoggerFactory.getLogger(ShoppingController.class);

    private static final Map<String, List<String>> PRODUCT_TYPES = Map.of(
            "annual", List.of("seeds", "plug plants"),
            "perennial", List.of("potted plant", "bare root", "plug plants"),
            "shrub", List.of("potted plant", "bare root"),
            "tree", List.of("potted tree", "bare root"),
            "bulb", List.of("bulbs"),
            "climber", List.of("potted plant", "bare root"),
            "herb", List.of("seeds", "potted plant"),
            "houseplant", List.of("potted plant", "houseplant")
    );

    private final ShoppingClient shoppingClient;
    private final Database database;

    public ShoppingController(ShoppingClient shoppingClient, Database database) {
        this.shoppingClient = shoppingClient;
        this.database = database;
    }

    @GetMapping("/api/plant/{plantId}/shop")
    public PlantShoppingData getShoppingData(@PathVariable int plantId) {
        PlantInfo plant = findPlantById(plantId);
        if (plant == null) {
            return new PlantShoppingData("Unknown", "", "", "", List.of(), List.of(), List.of(),
                    List.of(), false);
        }

        List<RetailerLink> retailerLinks = ShoppingClient.buildRetailerLinks(plant.commonName);

        List<ShoppingCategory> googleCategories = new ArrayList<>();
        List<ShoppingCategory> ebayResults = new ArrayList<>();
        List<ShoppingCategory> accessories = new ArrayList<>();
        boolean apiAvailable = shoppingClient.isApiAvailable();

        if (apiAvailable) {
            try {
                String plantType = plant.plantType != null ? plant.plantType.toLowerCase() : "";
                List<String> productTypes = PRODUCT_TYPES.getOrDefault(plantType, List.of("potted plant"));

                for (String productType : productTypes) {
                    String query = "buy " + plant.commonName + " " + productType + " UK";
                    List<ShoppingResult> results = shoppingClient.searchGoogleShopping(query);
                    String label = capitalise(productType);
                    googleCategories.add(new ShoppingCategory(label, query, results));
                }

                String ebayQuery = "buy " + plant.commonName + " seeds plants UK";
                List<ShoppingResult> ebayItems = shoppingClient.searchEbay(ebayQuery);
                ebayResults.add(new ShoppingCategory("All listings", ebayQuery, ebayItems));

                accessories = buildAccessories(plant);

            } catch (Exception e) {
                log.warn("Shopping API calls failed for plant '{}': {}. Retailer links are still available.", plant.commonName, e.getMessage());
                apiAvailable = false;
            }
        } else {
            log.info("SerpApi key not configured. Shopping panel will show retailer links only.");
        }

        return new PlantShoppingData(
                plant.commonName, plant.latinName, plant.description,
                plant.plantType, googleCategories, ebayResults,
                accessories, retailerLinks, apiAvailable
        );
    }

    private List<ShoppingCategory> buildAccessories(PlantInfo plant) {
        List<ShoppingCategory> accessories = new ArrayList<>();
        try {
            if (plant.soilPh != null && plant.soilPh.toLowerCase().contains("acid")) {
                String query = "buy ericaceous compost UK";
                List<ShoppingResult> results = shoppingClient.searchGoogleShopping(query);
                accessories.add(new ShoppingCategory("Ericaceous Compost", query, results));
            }
            if ("climber".equalsIgnoreCase(plant.plantType)) {
                String query = "buy garden trellis UK";
                List<ShoppingResult> results = shoppingClient.searchGoogleShopping(query);
                accessories.add(new ShoppingCategory("Garden Trellis", query, results));
            }
            if (plant.isIndoor) {
                String query = "buy indoor plant pot UK";
                List<ShoppingResult> results = shoppingClient.searchGoogleShopping(query);
                accessories.add(new ShoppingCategory("Indoor Plant Pot", query, results));
            }
            if ("full_sun".equalsIgnoreCase(plant.sunPreference) && "herb".equalsIgnoreCase(plant.plantType)) {
                String query = "buy herb growing kit UK";
                List<ShoppingResult> results = shoppingClient.searchGoogleShopping(query);
                accessories.add(new ShoppingCategory("Herb Growing Kit", query, results));
            }
        } catch (Exception e) {
            log.warn("Accessory search failed for '{}': {}. Skipping accessory suggestions.", plant.commonName, e.getMessage());
        }
        return accessories;
    }

    private PlantInfo findPlantById(int plantId) {
        String sql = """
                SELECT p.common_name, p.latin_name, p.plant_type, p.description, p.is_indoor,
                       pr.soil_ph, pr.sun_preference
                FROM plants p
                LEFT JOIN plant_requirements pr ON p.id = pr.plant_id
                WHERE p.id = ?
                """;
        try (Connection conn = database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, plantId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new PlantInfo(
                            rs.getString("common_name"),
                            rs.getString("latin_name"),
                            rs.getString("plant_type"),
                            rs.getString("description"),
                            rs.getInt("is_indoor") == 1,
                            rs.getString("soil_ph"),
                            rs.getString("sun_preference")
                    );
                }
            }
        } catch (Exception e) {
            log.error("Failed to look up plant {}: {}", plantId, e.getMessage());
        }
        return null;
    }

    private static String capitalise(String s) {
        if (s == null || s.isEmpty()) return s;
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

    private record PlantInfo(String commonName, String latinName, String plantType,
                             String description, boolean isIndoor, String soilPh, String sunPreference) {}
}
