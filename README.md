# Greenmove

A Rightmove companion app that helps you plan a garden for any property you're browsing. Paste a Rightmove URL and get personalised plant recommendations based on the real environmental conditions at that location.

## What it does

Greenmove analyses the soil, climate, air quality, and water hardness at any UK property and matches you with plants that will actually thrive there. Each plant is scored on how well it suits the specific conditions at your chosen property.

### Environmental analysis

For any Rightmove property, the app fetches:

- **Soil data** -- type, drainage, and pH from the national soil map (LandIS Soilscapes)
- **Climate data** -- rainfall, sunshine hours, frost risk, and RHS hardiness zone (Open-Meteo historical records)
- **Air quality** -- European AQI rating (Open-Meteo)
- **Water hardness** -- calcium carbonate levels at the postcode (DEFRA)

### Plant recommendations

The app scores 96 plants across six dimensions -- hardiness, soil type, pH, drainage, pollution tolerance, and water hardness -- using a weighted algorithm. Indoor plants (for properties without a garden) are scored on pollution and water tolerance only.

Each plant card shows:

- A suitability score and label (Perfect Match, Great, Good, or Worth a Try)
- A photo sourced from Wikipedia
- A hover tooltip showing the plant's specific requirements and how they align with the site

### Pet safety

If you have pets, select them from the dropdown and any toxic plants are automatically filtered out. Supports dogs, cats, rabbits, guinea pigs, tortoises, chickens, indoor birds, horses, snakes, and pigeons. Toxicity data is sourced from ASPCA, RHS, Blue Cross, and species-specific veterinary resources.

### Filtering and sorting

- **Filter by plant type** -- perennial, shrub, tree, climber, bulb, annual, or indoor
- **Filter by purpose** -- aesthetic (visual appeal), aromatic (fragrance), edible (fruit, veg, herbs), or functional (hedging, wildlife, screening)
- **Sort** by best match, least suitable, or alphabetically
- Filters work in combination and can be toggled on and off

### Bookmarkable URLs

Every property gets a clean URL like `/property/170345402` that you can bookmark or share. Pet selections are preserved in the URL as a comma-separated list.

## Tech stack

- **Backend** -- Java 21, Spring Boot 3.3.2, Thymeleaf
- **Database** -- SQLite (auto-created and seeded on first startup)
- **Frontend** -- Server-rendered HTML with vanilla JavaScript
- **Build** -- Gradle 8.10

No external API keys are required. All data sources used are freely available public APIs.

## Running locally

```bash
./gradlew bootRun
```

The app starts at [http://localhost:8080](http://localhost:8080). The SQLite database is created and seeded automatically on first run.

## Supported property types

Buy, rent, new homes, and student property pages from Rightmove. Commercial and overseas listings are not supported.
