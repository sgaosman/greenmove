package com.gardenplanner.model;

import java.util.List;

public record ShoppingCategory(
    String label,
    String query,
    List<ShoppingResult> results
) {}
