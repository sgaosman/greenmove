# Architecture Decision Records

## ADR-001: SQLite as the Database

**Status:** Accepted

**Context:** The application needs a database for the plant catalogue (96 plants, requirements, toxicity data) and shopping cache. It needs to work locally with zero setup and in a Docker container on Render's free tier.

**Decision:** Use SQLite via JDBC. The database file (`garden_planner.db`) is created and seeded automatically on first startup.

**Consequences:**
- Zero configuration for local development -- just run `./gradlew bootRun`
- No external database dependency or cost
- Shopping cache is lost on every Render redeployment (ephemeral filesystem)
- No connection pooling -- each request opens a new `DriverManager.getConnection()` call
- Single-writer limitation, though this is acceptable at current scale

**Alternatives considered:** PostgreSQL (would require a paid Render plan or external DB), H2 (similar trade-offs, less tooling).

---

## ADR-002: Parallel Environmental API Calls

**Status:** Accepted

**Context:** Building a site profile requires four independent API calls (soil, weather, air quality, water hardness). Sequential execution would take 2-4 seconds.

**Decision:** Use `CompletableFuture.supplyAsync()` to execute all four calls in parallel, then `CompletableFuture.allOf().join()` to wait for all results.

**Consequences:**
- Site profile construction takes ~1 second instead of ~3-4 seconds
- Each API call has its own try/catch with a fallback value, so one failure doesn't block others
- Uses the default ForkJoinPool, which is fine for IO-bound work at this scale

---

## ADR-003: Rightmove PAGE_MODEL Parsing (Not an Official API)

**Status:** Accepted

**Context:** Rightmove does not offer a public API. Property data (coordinates, postcode, garden status) is needed to build the environmental profile.

**Decision:** Fetch the property page HTML and parse the embedded `PAGE_MODEL` JavaScript object. Support both flat JSON and packed array formats.

**Consequences:**
- Provides access to rich property data including coordinates, features, and images
- Fragile: any change to Rightmove's page structure could break parsing
- Reliance on a `User-Agent` header to receive the full page
- The packed array format (integer references resolved recursively) required reverse-engineering
- No formal contract means no deprecation warnings

---

## ADR-004: SerpApi for Shopping Results

**Status:** Accepted

**Context:** Users should be able to buy recommended plants. Live pricing from multiple retailers adds value beyond static links.

**Decision:** Use SerpApi to search Google Shopping and eBay UK. Cache results for 24 hours in SQLite. Fall back to static retailer links when the API is unavailable or quota is exhausted.

**Consequences:**
- Live prices from hundreds of retailers
- Free tier limited to 100 searches/month -- each plant click uses 2-4 searches
- Graceful degradation: always shows 7 specialist retailer links regardless of API status
- Need to handle SerpApi-specific response quirks (`product_link` vs `link`, nested eBay price/reviews)

---

## ADR-005: Server-Side Rendering with Thymeleaf

**Status:** Accepted

**Context:** The application needs a web UI. Most of the logic is server-side (API calls, scoring, filtering).

**Decision:** Use Thymeleaf for server-side rendering with vanilla JavaScript for interactive features (pet selector, plant filtering/sorting, shopping panel).

**Consequences:**
- No build step for frontend assets
- SEO-friendly server-rendered HTML
- The shopping panel uses `fetch()` for async loading, which is the only client-side API call
- No component framework -- the JavaScript is procedural and lives in the template files
- Adding complex client-side interactivity would eventually warrant a frontend framework

---

## ADR-006: Docker Multi-Stage Build for Deployment

**Status:** Accepted

**Context:** Render's free tier supports Docker deployments. The build needs to compile Java and produce a minimal runtime image.

**Decision:** Two-stage Dockerfile:
1. **Build stage:** `eclipse-temurin:21-jdk` runs `./gradlew bootJar`
2. **Runtime stage:** `eclipse-temurin:21-jre` copies and runs the jar

**Consequences:**
- Runtime image is ~300MB instead of ~600MB (no JDK, no Gradle, no source)
- Render builds from the Dockerfile automatically on push to main
- Build takes ~2-3 minutes on Render's free tier

---

## ADR-007: Render Free Tier with Cron Keep-Alive

**Status:** Accepted

**Context:** The application needs free hosting that supports Docker and environment variables.

**Decision:** Host on Render's free tier. Use cron-job.org to ping the root URL every 14 minutes to prevent the container from spinning down.

**Consequences:**
- Free hosting with automatic deployments from GitHub
- Without the keep-alive ping, Render spins down the container after 15 minutes of inactivity, causing ~30-second cold starts
- The cron ping keeps the container warm at the cost of one trivial GET request every 14 minutes
- SQLite data is ephemeral (lost on each deploy), but plant data is re-seeded automatically

**Alternatives considered:** Oracle Cloud Always Free (abandoned due to resource constraints on 1-OCPU/1GB VM), Railway (limited free hours), Fly.io (requires credit card), Google Cloud Run (requires credit card).

---

## ADR-008: application.properties Excluded from Git

**Status:** Accepted

**Context:** `application.properties` contains API keys (`serpapi.api.key`, `mytapwater.api-key`). These must not be committed to the public repository.

**Decision:** Add `src/main/resources/application.properties` to `.gitignore` and remove it from git tracking with `git rm --cached`. On Render, API keys are set as environment variables which Spring Boot reads via `@Value` annotations with empty defaults.

**Consequences:**
- API keys are never in the git history (the file was cleaned before the `.gitignore` was added)
- New developers need to create their own `application.properties` from the documented environment variable names
- The app runs without any keys -- it falls back to estimation (water) and retailer links only (shopping)

---

## ADR-009: Postcode-Based Water Hardness Estimation

**Status:** Accepted

**Context:** The MyTapWater API has a very limited free tier (~100 requests/month). Water hardness varies regionally but is relatively stable within broad geographic areas.

**Decision:** When the API key is missing or quota is exhausted, estimate water hardness based on postcode prefix. Group UK postcodes into three hardness bands (hard/South-East at 280 PPM, soft/North-West at 40 PPM, soft/Scotland at 50 PPM, default 170 PPM).

**Consequences:**
- The app never fails due to water data -- it always has at least an estimate
- Regional accuracy is reasonable for scoring purposes, though individual postcode accuracy suffers
- The warning is logged so operators know when estimation is active

---

## ADR-010: Pet Toxicity as a Hard Filter

**Status:** Accepted

**Context:** Some plants are toxic to specific animals. Users need to know which plants are safe for their pets.

**Decision:** When pets are selected, toxic plants are completely excluded from the results rather than shown with a warning.

**Consequences:**
- Users never accidentally see (and potentially buy) a plant that could harm their pet
- This is a conservative approach -- some "mildly toxic" plants might cause only minor irritation
- The UI explains that plants have been filtered: "Plants toxic to your Dog(s) and Cat(s) have been filtered out"
- Toxicity data covers 10 pet types and is sourced from ASPCA, RHS, Blue Cross, and species-specific references
