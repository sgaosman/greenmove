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

### :shopping_cart: Shopping Panel :shopping_cart:

</div>

Click any plant card to open a slide-in shopping panel with real product listings from multiple sources:

- **Google Shopping** -- live product results from hundreds of UK retailers including Crocus, B&Q, and Amazon, with prices, ratings, reviews, and direct buy links
- **eBay** -- marketplace listings for seeds, plants, and bulk options, often at lower prices
- **Specialist retailers** -- always-available direct search links for Thompson & Morgan, Crocus, Suttons Seeds, B&Q, RHS Plants, Amazon, and Google Shopping (no API needed)
- **Accessory suggestions** -- contextual recommendations like ericaceous compost for acid-loving plants, trellises for climbers, and indoor pots for houseplants

Shopping results are cached for 24 hours to preserve API quota. The panel works without an API key -- it simply shows the specialist retailer links instead.

<div align="center">

---

## :wrench: Tech stack :wrench:

</div>

- **Backend** -- Java 21, Spring Boot 3.3.2, Thymeleaf
- **Database** -- SQLite (auto-created and seeded on first startup)
- **Frontend** -- Server-rendered HTML with vanilla JavaScript
- **Build** -- Gradle 8.10

No external API keys are required for core functionality. All environmental data sources are freely available public APIs. Optionally, add a [SerpApi](https://serpapi.com/) key for live shopping results (Google Shopping + eBay).

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

<div align="center">

---

## :crystal_ball: Upcoming features :crystal_ball:

</div>

- ~~**Purchase Sources** -- links to buy recommended plants from garden centres and online retailers~~ :white_check_mark: **Done!**
- **Saved Garden Lists** -- save and manage custom lists of plants for your dream garden
- **Saved Properties Lists** -- bookmark properties and compare their garden potential side by side
- **Seasonal Planting Calendar** -- show when to plant, prune, and harvest each recommended plant based on the property's climate zone
- **Garden Layout Planner** -- drag-and-drop visual tool to arrange plants in a bed, with spacing and sunlight guidance
- **Maintenance Difficulty Rating** -- score each plant on how much upkeep it needs so users can filter for low-maintenance gardens
- **Companion Planting Suggestions** -- flag which recommended plants grow well together and which to keep apart
- **Cost Estimator** -- rough budget for setting up the garden based on the selected plants
- **Share / Export** -- generate a shareable garden plan as a PDF or image, or share a link with the full plant list
- **Neighbourhood Insights** -- what other Greenmove users in the same postcode area are growing (anonymised and aggregated)
- **Climate Change Projections** -- how the site conditions might shift over 10-20 years and which plants will stay viable
