# Data Model

GreenMove uses SQLite with five tables, all created and seeded automatically on first startup by `Database.java`.

## Entity Relationship Diagram

```mermaid
erDiagram
    plants ||--o| plant_requirements : "has"
    plants ||--o{ plant_toxicity : "has"
    shopping_cache }o--o| plants : "caches results for"

    plants {
        INTEGER id PK "AUTOINCREMENT"
        TEXT common_name "NOT NULL"
        TEXT latin_name
        TEXT plant_type "annual, perennial, shrub, tree, bulb, climber, herb, houseplant"
        TEXT description
        TEXT image_url "Wikipedia source"
        INTEGER is_indoor "0 or 1"
        TEXT purpose "aesthetic, aromatic, edible, functional"
    }

    plant_requirements {
        INTEGER plant_id PK,FK "References plants(id)"
        TEXT min_hardiness "RHS zone: H1a-H7"
        TEXT soil_types "Comma-separated: clay, loam, sand, chalk, peat, any"
        TEXT soil_ph "acid, neutral, alkaline, any"
        TEXT drainage "free, moist, impeded, waterlogged, any"
        REAL min_sun_hours
        TEXT sun_preference "full_sun, partial_shade, full_shade"
        REAL min_rainfall_mm
        REAL max_rainfall_mm
        INTEGER pollution_tolerant "0 or 1"
        INTEGER hard_water_tolerant "0 or 1"
    }

    plant_toxicity {
        INTEGER plant_id FK "References plants(id)"
        TEXT animal "dog, cat, rabbit, guinea_pig, tortoise, chicken, bird, horse, snake, pigeon"
        INTEGER toxic_flag "0 or 1"
        TEXT severity "mild, moderate, severe, fatal"
        TEXT notes
    }

    site_profiles {
        TEXT postcode PK
        REAL latitude
        REAL longitude
        TEXT soil_type
        TEXT soil_drainage
        TEXT soil_ph_range
        REAL avg_annual_rainfall
        REAL avg_sunshine_hours
        REAL winter_min_temp
        TEXT rhs_hardiness_zone
        INTEGER air_quality_index
        REAL water_hardness_ppm
        TEXT last_updated
    }

    shopping_cache {
        TEXT query_key PK "e.g. google_shopping:buy lavender potted plant UK"
        TEXT engine "google_shopping or ebay"
        TEXT results_json "Full SerpApi response body"
        TEXT cached_at "ISO-8601 instant"
    }
```

## Table Details

### plants
The core plant catalogue. Seeded from `seed_plants.sql` (original set) and `seed_gap_plants.sql` (additional plants). Currently contains 96 plants. Images are populated separately via `seed_images.sql`.

`purpose` is set during seeding by `Database.categorizePlants()`:
- **aesthetic** (default) -- ornamental and visual appeal
- **aromatic** -- fragrant plants (lavender, jasmine, etc.)
- **edible** -- fruit, vegetables, herbs
- **functional** -- hedging, wildlife, screening, ground cover

### plant_requirements
One-to-one with `plants`. Defines the environmental conditions each plant needs. The [[04-scoring-algorithm]] compares these requirements against the `SiteProfile` to generate a suitability score.

### plant_toxicity
One-to-many with `plants`. Each row records whether a specific plant is toxic to a specific animal. Covers 10 pet types. Seeded from `seed_toxicity.sql`, sourced from ASPCA, RHS, Blue Cross, and species-specific veterinary databases.

### site_profiles
Stores environmental profiles by postcode. Currently created in the schema but not actively used for caching (identified as a [[09-future-features|future enhancement]]).

### shopping_cache
Caches raw SerpApi responses with a 24-hour TTL. The `query_key` includes the engine prefix (e.g. `google_shopping:buy lavender potted plant UK`) to namespace Google Shopping and eBay results. On Render's free tier, this cache is ephemeral and lost on redeployment.

## Seed Data Pipeline

```mermaid
flowchart TD
    A[Application Starts] --> B{plants table empty?}
    B -->|Yes| C[Execute seed_plants.sql]
    C --> D[Execute seed_gap_plants.sql]
    D --> E[categorizePlants - set purpose]
    B -->|No| F{plant_toxicity empty?}
    E --> F
    F -->|Yes| G[Execute seed_toxicity.sql]
    F -->|No| H{image_url all null?}
    G --> H
    H -->|Yes| I[Execute seed_images.sql]
    H -->|No| J[Ready]
    I --> J
```
