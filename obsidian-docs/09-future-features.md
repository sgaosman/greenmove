# Future Features

Features are grouped by category. Priority is indicated as P0 (critical), P1 (high), P2 (medium), or P3 (nice to have).

## Reliability and Resilience

| Feature | Priority | Description |
|---------|----------|-------------|
| HTTP Timeouts | P0 | Add connect and read timeouts to all external API calls (soil, weather, air quality, water, Rightmove) to prevent hung requests from blocking Tomcat threads indefinitely |
| Test Suite | P1 | Unit tests for the suitability scoring algorithm, Rightmove page parser (both flat and packed JSON formats), soil description parsing, and pet toxicity filtering |
| Rightmove Format Change Detection | P1 | Automated smoke tests against known property IDs to alert when the `PAGE_MODEL` format changes |
| Graceful Degradation Indicators | P2 | Surface to the user when environmental data has fallen back to defaults so they know which parts of their site profile are estimated rather than measured |

## Performance

| Feature | Priority | Description |
|---------|----------|-------------|
| N+1 Toxicity Query | P1 | Batch the per-plant toxicity lookups into a single query instead of issuing one query per plant during recommendation |
| Connection Pooling | P2 | Replace raw `DriverManager.getConnection()` with HikariCP to reuse database connections and bound concurrency |
| Site Profile Caching | P2 | Persist built site profiles to the `site_profiles` table so repeat lookups for the same postcode skip redundant API calls |

## Infrastructure

| Feature | Priority | Description |
|---------|----------|-------------|
| Persistent Database | P1 | Migrate shopping cache from SQLite to PostgreSQL so cached results survive redeployments |
| Monitoring and Health Checks | P2 | Add Spring Boot Actuator for `/actuator/health` and `/actuator/metrics`, plus external uptime monitoring |
| Shopping Quota Management | P2 | Track SerpApi usage against the monthly limit and surface quota status to the user rather than silently degrading |
| Swagger / OpenAPI | P3 | Add SpringDoc OpenAPI for interactive API documentation at `/swagger-ui.html`. Requires adding `springdoc-openapi-starter-webmvc-ui` dependency to `build.gradle` |

## User Features

| Feature | Priority | Description |
|---------|----------|-------------|
| Saved Garden Lists | P2 | Save and manage custom lists of plants for your dream garden |
| Saved Properties Lists | P2 | Bookmark properties and compare their garden potential side by side |
| Seasonal Planting Calendar | P2 | Show when to plant, prune, and harvest each recommended plant based on the property's climate zone |
| Maintenance Difficulty Rating | P3 | Score each plant on how much upkeep it needs so users can filter for low-maintenance gardens |
| Companion Planting Suggestions | P3 | Flag which recommended plants grow well together and which to keep apart |
| Cost Estimator | P3 | Rough budget for setting up the garden based on the selected plants |
| Share / Export | P3 | Generate a shareable garden plan as a PDF or image, or share a link with the full plant list |
| Garden Layout Planner | P3 | Drag-and-drop visual tool to arrange plants in a bed, with spacing and sunlight guidance |

## Experimental

| Feature | Priority | Description |
|---------|----------|-------------|
| Neighbourhood Insights | P3 | What other GreenMove users in the same postcode area are growing (anonymised and aggregated) |
| Climate Change Projections | P3 | How the site conditions might shift over 10-20 years and which plants will stay viable |
