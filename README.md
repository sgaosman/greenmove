<div align="center">

# :seedling: Greenmove :seedling:

**A Rightmove companion app that helps you plan a garden for any property you're browsing.**

Paste a Rightmove URL and get personalised plant recommendations based on the real environmental conditions at that location.

---

## :house_with_garden: What it does :house_with_garden:

</div>

Greenmove analyses the soil, climate, air quality, and water hardness at any UK property and matches you with plants that will actually thrive there. Each plant is scored on how well it suits the specific conditions at your chosen property.

<div align="center">

### :earth_africa: Environmental analysis :earth_africa:

</div>

For any Rightmove property, the app fetches:

- **Soil data** -- type, drainage, and pH from the national soil map (LandIS Soilscapes)
- **Climate data** -- rainfall, sunshine hours, frost risk, and RHS hardiness zone (Open-Meteo historical records)
- **Air quality** -- European AQI rating (Open-Meteo)
- **Water hardness** -- calcium carbonate levels at the postcode (DEFRA)

<div align="center">

### :blossom: Plant recommendations :blossom:

</div>

The app scores 96 plants across six dimensions -- hardiness, soil type, pH, drainage, pollution tolerance, and water hardness -- using a weighted algorithm. Indoor plants (for properties without a garden) are scored on pollution and water tolerance only.

Each plant card shows:

- A suitability score and label (Perfect Match, Great, Good, or Worth a Try)
- A photo sourced from Wikipedia
- A hover tooltip showing the plant's specific requirements and how they align with the site

<div align="center">

### :dog: Pet safety :cat:

</div>

If you have pets, select them from the dropdown and any toxic plants are automatically filtered out. Supported pets are based on the [top 10 most popular pets in the UK](https://www.ukpetfood.org/industry-hub/data-statistics-/uk-pet-population-.html):

- Dogs
- Cats
- Rabbits
- Guinea pigs
- Tortoises
- Chickens
- Indoor birds
- Horses / ponies
- Snakes
- Pigeons

Toxicity data is sourced from ASPCA, RHS, Blue Cross, and species-specific veterinary resources.

<div align="center">

### :mag: Filtering and sorting :bar_chart:

</div>

- **Filter by plant type** -- perennial, shrub, tree, climber, bulb, annual, or indoor
- **Filter by purpose** -- aesthetic (visual appeal), aromatic (fragrance), edible (fruit, veg, herbs), or functional (hedging, wildlife, screening)
- **Sort** by best match, least suitable, or alphabetically
- Filters work in combination and can be toggled on and off

<div align="center">

### :bookmark: Bookmarkable URLs :link:

</div>

Every property gets a clean URL like `/property/170345402` that you can bookmark or share. Pet selections are preserved in the URL as a comma-separated list.

<div align="center">

---

## :wrench: Tech stack :wrench:

</div>

- **Backend** -- Java 21, Spring Boot 3.3.2, Thymeleaf
- **Database** -- SQLite (auto-created and seeded on first startup)
- **Frontend** -- Server-rendered HTML with vanilla JavaScript
- **Build** -- Gradle 8.10

No external API keys are required. All data sources used are freely available public APIs.

<div align="center">

---

## :rocket: Running locally :rocket:

</div>

```bash
./gradlew bootRun
```

The app starts at [http://localhost:8080](http://localhost:8080). The SQLite database is created and seeded automatically on first run.

<div align="center">

---

## :house_with_garden:  Supported property types :house_with_garden:

</div>

Buy, rent, new homes, and student property pages from Rightmove. Commercial and overseas listings are not supported.
