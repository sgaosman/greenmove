package com.gardenplanner.controller;

import com.gardenplanner.model.Plant;
import com.gardenplanner.model.PropertyData;
import com.gardenplanner.model.SiteProfile;
import com.gardenplanner.rightmove.RightmovePageParser;
import com.gardenplanner.service.EnvironmentService;
import com.gardenplanner.service.PropertyService;
import com.gardenplanner.service.RecommendationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.stream.Collectors;

@Controller
public class GardenController {

    private static final Map<String, String> PET_OPTIONS = new LinkedHashMap<>();
    static {
        PET_OPTIONS.put("dog", "Dog");
        PET_OPTIONS.put("cat", "Cat");
        PET_OPTIONS.put("rabbit", "Rabbit");
        PET_OPTIONS.put("guinea_pig", "Guinea Pig");
        PET_OPTIONS.put("tortoise", "Tortoise");
        PET_OPTIONS.put("chicken", "Chicken");
        PET_OPTIONS.put("bird", "Indoor Bird");
        PET_OPTIONS.put("horse", "Horse / Pony");
        PET_OPTIONS.put("snake", "Snake");
        PET_OPTIONS.put("pigeon", "Pigeon");
    }

    private final PropertyService propertyService;
    private final EnvironmentService environmentService;
    private final RecommendationService recommendationService;

    public GardenController(PropertyService propertyService,
                            EnvironmentService environmentService,
                            RecommendationService recommendationService) {
        this.propertyService = propertyService;
        this.environmentService = environmentService;
        this.recommendationService = recommendationService;
    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("petOptions", PET_OPTIONS);
        return "index";
    }

    @PostMapping("/search")
    public String search(@RequestParam String rightmoveUrl,
                         @RequestParam(required = false) List<String> pets) {
        String propertyId = RightmovePageParser.extractPropertyId(rightmoveUrl);
        StringBuilder redirect = new StringBuilder("redirect:/property/" + propertyId);
        if (pets != null && !pets.isEmpty()) {
            redirect.append("?pets=");
            redirect.append(String.join(",", pets));
        }
        return redirect.toString();
    }

    @GetMapping("/property/{propertyId}")
    public String propertyLoading(@PathVariable String propertyId,
                                   @RequestParam(required = false) String pets,
                                   Model model) {
        model.addAttribute("propertyId", propertyId);
        model.addAttribute("selectedPets", parsePets(pets));
        return "loading";
    }

    @GetMapping("/property/{propertyId}/results")
    public String propertyResults(@PathVariable String propertyId,
                                   @RequestParam(required = false) String pets,
                                   Model model) {
        try {
            List<String> selectedPets = parsePets(pets);

            PropertyData property = propertyService.parsePropertyById(propertyId);
            SiteProfile profile = environmentService.buildProfile(property);
            List<Plant> plants = recommendationService.recommend(profile, property.isHasGarden(), selectedPets);

            List<String> plantTypes = plants.stream()
                    .map(Plant::getPlantType)
                    .filter(t -> t != null && !t.isBlank())
                    .collect(Collectors.toCollection(TreeSet::new))
                    .stream().toList();

            List<String> purposeTypes = plants.stream()
                    .map(Plant::getPurpose)
                    .filter(p -> p != null && !p.isBlank())
                    .collect(Collectors.toCollection(TreeSet::new))
                    .stream().toList();

            model.addAttribute("property", property);
            model.addAttribute("profile", profile);
            model.addAttribute("plants", plants);
            model.addAttribute("plantCount", plants.size());
            model.addAttribute("plantTypes", plantTypes);
            model.addAttribute("purposeTypes", purposeTypes);
            model.addAttribute("petOptions", PET_OPTIONS);
            model.addAttribute("selectedPets", selectedPets);
            model.addAttribute("petFilterMessage", buildPetFilterMessage(selectedPets));

            return "results";
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("propertyId", propertyId);
            return "error";
        }
    }

    private List<String> parsePets(String pets) {
        if (pets == null || pets.isBlank()) return List.of();
        return List.of(pets.split(","));
    }

    private String buildPetFilterMessage(List<String> pets) {
        if (pets.isEmpty()) return "";
        List<String> names = pets.stream()
                .map(p -> PET_OPTIONS.getOrDefault(p, p) + "(s)")
                .toList();
        String joined;
        if (names.size() == 1) {
            joined = names.get(0);
        } else {
            joined = String.join(", ", names.subList(0, names.size() - 1))
                    + " and " + names.get(names.size() - 1);
        }
        return "Plants toxic to your " + joined + " have been filtered out. All plants shown are safe for your pets.";
    }
}
