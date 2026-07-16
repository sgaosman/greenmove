package com.gardenplanner.model;

public record ShoppingResult(
    String title,
    String link,
    String source,
    String sourceIcon,
    String price,
    Double extractedPrice,
    String oldPrice,
    String thumbnail,
    Double rating,
    Integer reviews,
    String delivery,
    String condition,
    String badge,
    String origin
) {}
