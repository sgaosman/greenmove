package com.gardenplanner.service;

import com.gardenplanner.model.PropertyData;
import com.gardenplanner.rightmove.RightmovePageParser;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class PropertyService {

    public PropertyData parseProperty(String rightmoveUrl) throws IOException, InterruptedException {
        String propertyId = RightmovePageParser.extractPropertyId(rightmoveUrl);
        return parsePropertyById(propertyId);
    }

    public PropertyData parsePropertyById(String propertyId) throws IOException, InterruptedException {
        JsonObject pageModel = RightmovePageParser.fetchPageModel(propertyId);
        return RightmovePageParser.parseProperty(propertyId, pageModel);
    }
}
