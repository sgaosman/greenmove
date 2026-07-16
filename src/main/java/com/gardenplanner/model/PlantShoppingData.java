package com.gardenplanner.model;

import java.util.List;

public record PlantShoppingData(
    String plantCommonName,
    String plantLatinName,
    String plantDescription,
    String plantType,
    List<ShoppingCategory> googleCategories,
    List<ShoppingCategory> ebayResults,
    List<ShoppingCategory> accessories,
    List<RetailerLink> retailerLinks,
    boolean apiAvailable
) {}
