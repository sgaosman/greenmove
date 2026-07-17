# Troubleshooting

## Common Issues

### "Could not find PAGE_MODEL in page source"

**Cause:** Rightmove has changed their page structure, or the property URL is invalid (commercial, overseas, or removed listing).

**Fix:**
1. Check that the property URL is a valid UK residential listing on Rightmove
2. Try opening the URL in a browser to confirm it loads
3. If the property exists but parsing fails, Rightmove may have changed their page format. Check `RightmovePageParser.java` -- the parser looks for `PAGE_MODEL` in the HTML source

### Shopping panel shows only retailer links (no prices)

**Cause:** The SerpApi key is not configured, or the monthly quota (100 searches) is exhausted.

**Check:**
1. Verify the `SERPAPI_API_KEY` environment variable is set (on Render) or `serpapi.api.key` is set in `application.properties` (locally)
2. Check application logs for `SerpApi quota exhausted` warnings
3. Log in to your SerpApi dashboard to check remaining searches

**Note:** This is expected behaviour, not a bug. The shopping panel is designed to degrade gracefully to retailer links when the API is unavailable.

### Water hardness seems inaccurate

**Cause:** The MyTapWater API key is missing, expired, or has hit its quota. The app has fallen back to postcode-based estimation.

**Check:**
1. Look for `MyTapWater API credits have reached their limit` in the logs
2. Verify the `MYTAPWATER_API_KEY` environment variable is set
3. The postcode estimation groups large regions into three hardness bands, which may not reflect local variation

### Shopping result links go to localhost or are broken

**Cause:** Stale cached results in the shopping cache. This was a historical issue where Google Shopping API results were cached with incorrect URLs before a bug fix (the API uses `product_link` not `link`).

**Fix:**
1. Delete the SQLite database to clear the cache: `rm garden_planner.db`
2. Restart the application -- it will recreate the database and re-seed plant data
3. Shopping results will be freshly fetched from SerpApi

### First load is very slow (~30 seconds)

**Cause:** Render's free tier has spun down the container due to inactivity. The cold start involves booting the JVM, creating the SQLite database, and seeding all plant data.

**Fix:**
1. Wait for the initial load to complete -- subsequent requests will be fast
2. Verify the cron-job.org keep-alive ping is active and running every 14 minutes
3. If the cron job has stopped, reconfigure it. See [[10-deployment]]

### "Unmatched brace in PAGE_MODEL JSON"

**Cause:** The `PAGE_MODEL` JSON in the Rightmove page source is malformed or the parser's brace-matching algorithm hit an edge case.

**Fix:**
1. Try a different property URL to confirm it's property-specific vs. systemic
2. If systemic, Rightmove may have changed their JSON encoding. Inspect the page source manually (`view-source:` in the browser, search for `PAGE_MODEL`)

### Plants are not showing for a property with a garden

**Cause:** Garden detection may have failed. The app checks `keyFeatures` and `text.description` for the word "garden". If the listing doesn't mention "garden" explicitly, the app assumes no garden and shows indoor plants only.

**Impact:** Users see indoor plant recommendations instead of outdoor ones.

**Workaround:** This is currently not user-configurable. A future enhancement could add a manual garden toggle.

### All plants show similar scores

**Cause:** The environmental API calls may have failed silently, causing all dimensions to use default values. When all plants are scored against the same default profile, scores converge.

**Check:** Look for `Soil API failed, using defaults`, `Weather API failed, using defaults`, etc. in the logs. If multiple APIs failed, the site profile is mostly defaults and the scoring loses its discriminating power.

## Logs

### Local

Application logs are printed to stdout. Run with:
```bash
./gradlew bootRun
```

### Render

View logs in the Render dashboard:
1. Go to your Render dashboard
2. Select the `greenmove` service
3. Click **Logs** in the left sidebar

### Key Log Messages to Watch For

| Log Message | Meaning |
|-------------|---------|
| `SerpApi quota exhausted (HTTP 429)` | Monthly SerpApi limit reached |
| `SerpApi quota exhausted (HTTP 402)` | SerpApi account suspended or payment issue |
| `MyTapWater API credits have reached their limit` | Monthly MyTapWater limit reached |
| `Soil API failed, using defaults` | LandIS Soilscapes returned an error |
| `Weather API failed, using defaults` | Open-Meteo historical weather returned an error |
| `Air quality API failed, using defaults` | Open-Meteo air quality returned an error |
| `Water quality API failed, using defaults` | MyTapWater returned an error |
| `SerpApi key not configured` | No shopping API key; retailer links only |
| `Shopping API calls failed for plant` | Shopping search threw an exception |

## Resetting the Database

To reset all data (plant catalogue, toxicity, shopping cache):

```bash
rm garden_planner.db
./gradlew bootRun
```

The database is recreated and seeded automatically on startup.

## Useful Debugging Commands

```bash
# Check if the app is running
curl -s -o /dev/null -w "%{http_code}" http://localhost:8080

# Test a specific property
curl -s http://localhost:8080/property/170345402/results | head -50

# Test the shopping API
curl -s http://localhost:8080/api/plant/1/shop | python3 -m json.tool

# Check the database
sqlite3 garden_planner.db "SELECT COUNT(*) FROM plants;"
sqlite3 garden_planner.db "SELECT COUNT(*) FROM shopping_cache;"
sqlite3 garden_planner.db "SELECT query_key, cached_at FROM shopping_cache;"
```
