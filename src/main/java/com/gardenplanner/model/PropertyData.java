package com.gardenplanner.model;

public class PropertyData {

    private final String propertyId;
    private final double latitude;
    private final double longitude;
    private final String outcode;
    private final String incode;
    private final String postcode;
    private final String displayAddress;
    private final boolean hasGarden;
    private final int bedrooms;
    private final String propertyType;
    private final String imageUrl;

    public PropertyData(String propertyId, double latitude, double longitude,
                        String outcode, String incode, String postcode,
                        String displayAddress, boolean hasGarden,
                        int bedrooms, String propertyType, String imageUrl) {
        this.propertyId = propertyId;
        this.latitude = latitude;
        this.longitude = longitude;
        this.outcode = outcode;
        this.incode = incode;
        this.postcode = postcode;
        this.displayAddress = displayAddress;
        this.hasGarden = hasGarden;
        this.bedrooms = bedrooms;
        this.propertyType = propertyType;
        this.imageUrl = imageUrl;
    }

    public String getPropertyId() { return propertyId; }
    public double getLatitude() { return latitude; }
    public double getLongitude() { return longitude; }
    public String getOutcode() { return outcode; }
    public String getIncode() { return incode; }
    public String getPostcode() { return postcode; }
    public String getDisplayAddress() { return displayAddress; }
    public boolean isHasGarden() { return hasGarden; }
    public int getBedrooms() { return bedrooms; }
    public String getPropertyType() { return propertyType; }
    public String getImageUrl() { return imageUrl; }
}
