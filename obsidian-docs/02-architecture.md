# Architecture

## System Context

```mermaid
C4Context
    title GreenMove - System Context

    Person(user, "User", "UK property buyer/renter browsing Rightmove")
    System(greenmove, "GreenMove", "Analyses environmental conditions at UK properties and recommends suitable plants")
    System_Ext(rightmove, "Rightmove", "UK property listings")
    System_Ext(soilscapes, "LandIS Soilscapes", "National soil map (Cranfield)")
    System_Ext(openmeteo, "Open-Meteo", "Historical weather + air quality")
    System_Ext(mytapwater, "MyTapWater", "Water hardness by postcode")
    System_Ext(serpapi, "SerpApi", "Google Shopping + eBay search")

    Rel(user, greenmove, "Pastes Rightmove URL")
    Rel(greenmove, rightmove, "Fetches PAGE_MODEL HTML")
    Rel(greenmove, soilscapes, "Soil type, drainage, pH")
    Rel(greenmove, openmeteo, "Rainfall, sunshine, frost, AQI")
    Rel(greenmove, mytapwater, "Water hardness PPM")
    Rel(greenmove, serpapi, "Shopping results")
```

## Component Diagram

```mermaid
graph TB
    subgraph "Spring Boot Application"
        subgraph "Controllers"
            GC[GardenController]
            SC[ShoppingController]
        end

        subgraph "Services"
            ES[EnvironmentService]
            RS[RecommendationService]
            PS[PropertyService]
        end

        subgraph "API Clients"
            RMP[RightmovePageParser]
            SOIL[SoilClient]
            WX[WeatherClient]
            AQ[AirQualityClient]
            WQ[WaterQualityClient]
            SHOP[ShoppingClient]
        end

        subgraph "Data Layer"
            DB[Database]
            PR[PlantRepository]
        end

        subgraph "Templates"
            IDX[landing.html]
            LOAD[loading.html]
            RES[results.html]
            ERR[error.html]
        end
    end

    GC --> PS
    GC --> ES
    GC --> RS
    SC --> SHOP
    SC --> DB
    PS --> RMP
    ES --> SOIL
    ES --> WX
    ES --> AQ
    ES --> WQ
    RS --> PR
    PR --> DB
    SHOP --> DB

    style GC fill:#4a9eff,color:#fff
    style SC fill:#4a9eff,color:#fff
    style ES fill:#47b881,color:#fff
    style RS fill:#47b881,color:#fff
    style PS fill:#47b881,color:#fff
```

## Request Flow: Property Analysis

```mermaid
sequenceDiagram
    actor User
    participant Browser
    participant GardenController
    participant PropertyService
    participant Rightmove
    participant EnvironmentService
    participant SoilClient
    participant WeatherClient
    participant AirQualityClient
    participant WaterQualityClient
    participant RecommendationService
    participant PlantRepository

    User->>Browser: Paste Rightmove URL + select pets
    Browser->>GardenController: POST /search
    GardenController-->>Browser: 302 Redirect /property/{id}
    Browser->>GardenController: GET /property/{id}
    GardenController-->>Browser: loading.html (spinner page)
    Browser->>GardenController: GET /property/{id}/results

    GardenController->>PropertyService: parsePropertyById(id)
    PropertyService->>Rightmove: GET /properties/{id}
    Rightmove-->>PropertyService: HTML with PAGE_MODEL JSON
    PropertyService-->>GardenController: PropertyData

    GardenController->>EnvironmentService: buildProfile(property)

    par Parallel API calls
        EnvironmentService->>SoilClient: getSoilData(lat, lon)
        SoilClient-->>EnvironmentService: SoilData
    and
        EnvironmentService->>WeatherClient: getHistoricalWeather(lat, lon)
        WeatherClient-->>EnvironmentService: WeatherData
    and
        EnvironmentService->>AirQualityClient: getAirQuality(lat, lon)
        AirQualityClient-->>EnvironmentService: AirQualityData
    and
        EnvironmentService->>WaterQualityClient: getWaterQuality(postcode)
        WaterQualityClient-->>EnvironmentService: WaterData
    end

    EnvironmentService-->>GardenController: SiteProfile

    GardenController->>RecommendationService: recommend(profile, hasGarden, pets)
    RecommendationService->>PlantRepository: findMatchingPlants(...)
    PlantRepository-->>RecommendationService: List<Plant> (scored + filtered)
    RecommendationService-->>GardenController: List<Plant>

    GardenController-->>Browser: results.html (plant cards)
```

## Request Flow: Shopping Panel

```mermaid
sequenceDiagram
    actor User
    participant Browser
    participant ShoppingController
    participant ShoppingClient
    participant SerpApi
    participant SQLite

    User->>Browser: Click plant card
    Browser->>ShoppingController: GET /api/plant/{id}/shop

    ShoppingController->>SQLite: Look up plant info
    SQLite-->>ShoppingController: PlantInfo

    ShoppingController->>ShoppingClient: searchGoogleShopping(query)
    ShoppingClient->>SQLite: Check cache (24h TTL)

    alt Cache hit
        SQLite-->>ShoppingClient: Cached results
    else Cache miss
        ShoppingClient->>SerpApi: GET /search.json?engine=google_shopping
        SerpApi-->>ShoppingClient: Shopping results JSON
        ShoppingClient->>SQLite: Store in shopping_cache
    end

    ShoppingClient-->>ShoppingController: List<ShoppingResult>

    ShoppingController->>ShoppingClient: searchEbay(query)
    Note over ShoppingClient: Same cache check pattern

    ShoppingClient-->>ShoppingController: List<ShoppingResult>
    ShoppingController-->>Browser: PlantShoppingData JSON
    Browser->>Browser: Render slide-in panel
```

## Deployment Architecture

```mermaid
graph LR
    subgraph "Internet"
        USER[User Browser]
        CRON[cron-job.org]
    end

    subgraph "Render (Free Tier)"
        subgraph "Docker Container"
            JRE[JRE 21]
            APP[Spring Boot App]
            SQLITE[(SQLite DB)]
        end
    end

    subgraph "External APIs"
        RM[Rightmove]
        SOIL[LandIS]
        OM[Open-Meteo]
        MTW[MyTapWater]
        SERP[SerpApi]
    end

    USER -->|HTTPS| APP
    CRON -->|GET / every 14 min| APP
    APP --> SQLITE
    APP --> RM
    APP --> SOIL
    APP --> OM
    APP --> MTW
    APP --> SERP

    style APP fill:#4a9eff,color:#fff
    style SQLITE fill:#f5a623,color:#fff
```

## Directory Structure

```
garden-planner/
  src/main/java/com/gardenplanner/
    api/
      AirQualityClient.java        # Open-Meteo air quality
      ShoppingClient.java           # SerpApi Google Shopping + eBay
      SoilClient.java               # LandIS Soilscapes
      WaterQualityClient.java       # MyTapWater/DEFRA
      WeatherClient.java            # Open-Meteo historical weather
    controller/
      GardenController.java         # Main page + property results
      ShoppingController.java       # REST API for shopping panel
    db/
      Database.java                 # Schema creation + seed data
      PlantRepository.java          # Plant queries + scoring
    model/
      Plant.java                    # Plant entity with scoring fields
      PlantShoppingData.java        # Shopping panel response DTO
      PropertyData.java             # Parsed Rightmove property
      RetailerLink.java             # Specialist retailer link
      ShoppingCategory.java         # Grouped shopping results
      ShoppingResult.java           # Normalised shopping item
      SiteProfile.java              # Environmental conditions
    rightmove/
      RightmovePageParser.java      # Rightmove HTML/JSON parser
    service/
      EnvironmentService.java       # Parallel API orchestration
      PropertyService.java          # Property fetching
      RecommendationService.java    # Plant recommendation entry point
  src/main/resources/
    templates/
      landing.html                  # Landing page
      loading.html                  # Loading spinner
      results.html                  # Plant results + shopping panel
      error.html                    # Error page
    static/css/
      style.css                     # All styles inc. shopping panel
    seed_plants.sql                 # Core plant + requirements data
    seed_gap_plants.sql             # Additional plants
    seed_toxicity.sql               # Pet toxicity data
    seed_images.sql                 # Wikipedia image URLs
    application.properties          # Config (excluded from git)
  docs/                             # This documentation vault
  Dockerfile                        # Multi-stage Docker build
  render.yaml                       # Render deployment blueprint
  build.gradle                      # Gradle build config
```
