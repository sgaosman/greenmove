# Overview

## Purpose

GreenMove is a web application that helps UK property buyers and renters plan a garden for any property they find on Rightmove. Users paste a Rightmove property URL, and the app analyses the real environmental conditions at that location to recommend plants that will thrive there.

The core insight is that gardening advice is highly location-specific. Soil type, rainfall, frost risk, air quality, and water hardness all vary significantly across the UK and all affect which plants succeed. GreenMove automates this analysis by fetching real data from public APIs and matching it against a curated plant database.

## Target Audience

- UK property buyers browsing Rightmove who want to understand what they could grow at a prospective home
- Renters evaluating properties with gardens or balconies
- Anyone curious about the growing conditions at a specific UK location

## Key Features

### Environmental Analysis
For any Rightmove property, the app fetches:
- **Soil data** from LandIS Soilscapes (type, drainage, pH)
- **Climate data** from Open-Meteo (4-year historical rainfall, sunshine, frost)
- **Air quality** from Open-Meteo (European AQI)
- **Water hardness** from MyTapWater/DEFRA (calcium carbonate PPM)

### Plant Recommendations
96 plants scored across six dimensions using a [[04-scoring-algorithm|weighted algorithm]]. Each plant card shows a suitability score, photo, and hover tooltip with detailed requirement alignment.

### Pet Safety
Users can select from 10 pet types. Toxic plants are filtered out automatically. Toxicity data is sourced from ASPCA, RHS, Blue Cross, and species-specific veterinary references.

### Shopping Panel
Clicking a plant card opens a slide-in panel with live shopping results from Google Shopping and eBay (via SerpApi), plus always-available links to 7 UK specialist retailers. Contextual accessory suggestions are included based on plant properties.

### Filtering and Sorting
- Filter by plant type (perennial, shrub, tree, climber, bulb, annual, indoor)
- Filter by purpose (aesthetic, aromatic, edible, functional)
- Sort by best match, least suitable, or alphabetically

### Bookmarkable URLs
Every property gets a clean URL (`/property/{id}`) that preserves pet selections as query parameters.

## How It Works (High Level)

1. User pastes a Rightmove URL
2. App extracts the property ID, fetches the Rightmove page, and parses `PAGE_MODEL` JSON for coordinates, postcode, garden status, and metadata
3. Four environmental API calls run in parallel (soil, weather, air quality, water hardness)
4. A site profile is built from the combined environmental data
5. All plants in the database are scored against the site profile
6. Plants below the minimum threshold (35/100) are excluded
7. Toxic plants are excluded if pets are selected
8. Results are rendered as a sorted, filterable grid of plant cards

See [[02-architecture]] for diagrams.
