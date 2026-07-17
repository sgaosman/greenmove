# API Reference

GreenMove exposes a small set of HTTP endpoints. The application is server-rendered via Thymeleaf, with one REST API endpoint for the shopping panel.

> **Future enhancement:** Add SpringDoc OpenAPI (Swagger UI) for interactive API documentation. See [[09-future-features]].

## Endpoints

### `GET /`

**Description:** Landing page with the Rightmove URL input form and pet selector.

**Response:** HTML page (`landing.html` template).

**Model attributes:**
- `petOptions` -- ordered map of pet keys to display names

---

### `POST /search`

**Description:** Accepts a Rightmove URL, extracts the property ID, and redirects to the property page.

**Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `rightmoveUrl` | form field | Yes | Full Rightmove property URL |
| `pets` | form field (multi) | No | Selected pet type keys |

**Response:** `302 Redirect` to `/property/{propertyId}?pets={csv}`

**Example:**
```
POST /search
Content-Type: application/x-www-form-urlencoded

rightmoveUrl=https://www.rightmove.co.uk/properties/170345402&pets=dog&pets=cat
```
Redirects to: `/property/170345402?pets=dog,cat`

---

### `GET /property/{propertyId}`

**Description:** Loading page shown while environmental data is being fetched. Displays a spinner and immediately triggers a request to the results endpoint.

**Path parameters:**

| Name | Type | Description |
|------|------|-------------|
| `propertyId` | String | Rightmove numeric property ID |

**Query parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `pets` | String | No | Comma-separated pet type keys |

**Response:** HTML page (`loading.html` template).

---

### `GET /property/{propertyId}/results`

**Description:** The main results page. Fetches property data from Rightmove, builds the environmental site profile, scores all plants, and returns the results page.

**Path parameters:**

| Name | Type | Description |
|------|------|-------------|
| `propertyId` | String | Rightmove numeric property ID |

**Query parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `pets` | String | No | Comma-separated pet type keys (e.g. `dog,cat,rabbit`) |

**Response:** HTML page (`results.html` template) on success, or `error.html` on failure.

**Model attributes on success:**
- `property` -- `PropertyData` (address, coords, garden status, bedrooms, type, image)
- `profile` -- `SiteProfile` (all environmental data)
- `plants` -- `List<Plant>` (scored and sorted)
- `plantCount` -- total number of matching plants
- `plantTypes` -- distinct plant type strings for filtering
- `purposeTypes` -- distinct purpose strings for filtering
- `petOptions` -- map of all available pets
- `selectedPets` -- list of currently selected pet keys
- `petFilterMessage` -- human-readable message about excluded plants

**Error model attributes:**
- `errorMessage` -- description of what went wrong
- `propertyId` -- the requested property ID

---

### `GET /api/plant/{plantId}/shop`

**Description:** REST endpoint returning shopping data for a specific plant. Called asynchronously by the shopping panel JavaScript.

**Path parameters:**

| Name | Type | Description |
|------|------|-------------|
| `plantId` | int | Internal plant ID from the database |

**Response:** JSON `PlantShoppingData` object.

**Response body:**
```json
{
  "plantCommonName": "Lavender",
  "plantLatinName": "Lavandula angustifolia",
  "plantDescription": "Fragrant purple flowers...",
  "plantType": "shrub",
  "googleCategories": [
    {
      "label": "Potted Plant",
      "query": "buy Lavender potted plant UK",
      "results": [
        {
          "title": "Lavender Hidcote - 2L Pot",
          "link": "https://www.crocus.co.uk/...",
          "source": "Crocus",
          "sourceIcon": "https://...",
          "price": "£12.99",
          "extractedPrice": 12.99,
          "oldPrice": null,
          "thumbnail": "https://...",
          "rating": 4.5,
          "reviews": 128,
          "delivery": "Free delivery",
          "condition": null,
          "badge": "Great price",
          "origin": "google_shopping"
        }
      ]
    }
  ],
  "ebayResults": [
    {
      "label": "All listings",
      "query": "buy Lavender seeds plants UK",
      "results": [
        {
          "title": "Lavender Seeds - English Lavender",
          "link": "https://www.ebay.co.uk/...",
          "source": "eBay",
          "sourceIcon": null,
          "price": "£2.49",
          "extractedPrice": 2.49,
          "oldPrice": null,
          "thumbnail": "https://...",
          "rating": 4.8,
          "reviews": 56,
          "delivery": "Free postage",
          "condition": "New",
          "badge": null,
          "origin": "ebay"
        }
      ]
    }
  ],
  "accessories": [
    {
      "label": "Ericaceous Compost",
      "query": "buy ericaceous compost UK",
      "results": [...]
    }
  ],
  "retailerLinks": [
    {
      "name": "Thompson & Morgan",
      "domain": "thompson-morgan.com",
      "searchUrl": "https://www.thompson-morgan.com/search?q=Lavender",
      "description": "UK's oldest seed merchant. Seeds, plants, bulbs."
    },
    {
      "name": "Crocus",
      "domain": "crocus.co.uk",
      "searchUrl": "https://www.crocus.co.uk/search/_/Lavender/",
      "description": "Award-winning online garden centre."
    }
  ],
  "apiAvailable": true
}
```

**When SerpApi key is not configured:**
- `apiAvailable` will be `false`
- `googleCategories`, `ebayResults`, and `accessories` will be empty arrays
- `retailerLinks` will still contain all 7 specialist retailers

**Search queries by plant type:**

| Plant Type | Google Shopping Queries |
|------------|----------------------|
| annual | seeds, plug plants |
| perennial | potted plant, bare root, plug plants |
| shrub | potted plant, bare root |
| tree | potted tree, bare root |
| bulb | bulbs |
| climber | potted plant, bare root |
| herb | seeds, potted plant |
| houseplant | potted plant, houseplant |

**Accessory suggestions (contextual):**

| Condition | Accessory |
|-----------|-----------|
| Plant prefers acid soil pH | Ericaceous Compost |
| Plant type is climber | Garden Trellis |
| Plant is indoor | Indoor Plant Pot |
| Herb with full sun preference | Herb Growing Kit |

## Specialist Retailers

The following retailers are always included in shopping responses regardless of API availability:

| Retailer | Domain | URL Pattern |
|----------|--------|-------------|
| Thompson & Morgan | thompson-morgan.com | `/search?q={plant}` |
| Crocus | crocus.co.uk | `/search/_/{plant}/` |
| Suttons Seeds | suttons.co.uk | `/search?q={plant}` |
| B&Q | diy.com | `/search?term={plant}` |
| RHS Plants | rhsplants.co.uk | `/search?q={plant}` |
| Amazon | amazon.co.uk | `/s?k={plant}+seeds+plants` |
| Google Shopping | google.co.uk | `/search?q=buy+{plant}&tbm=shop` |
