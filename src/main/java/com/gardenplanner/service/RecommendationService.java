package com.gardenplanner.service;

import com.gardenplanner.db.PlantRepository;
import com.gardenplanner.model.Plant;
import com.gardenplanner.model.SiteProfile;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecommendationService {

    private final PlantRepository plantRepository;

    public RecommendationService(PlantRepository plantRepository) {
        this.plantRepository = plantRepository;
    }

    public List<Plant> recommend(SiteProfile profile, boolean hasGarden) {
        return plantRepository.findMatchingPlants(profile, hasGarden);
    }

    public List<Plant> recommend(SiteProfile profile, boolean hasGarden, List<String> pets) {
        return plantRepository.findMatchingPlants(profile, hasGarden, pets);
    }
}
