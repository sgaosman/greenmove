# Scoring Algorithm

The suitability scoring algorithm lives in `PlantRepository.calculateSuitability()`. It evaluates each plant against the environmental conditions at the property and produces a score from 0 to 100.

## Scoring Dimensions

Plants are scored across six dimensions. Each dimension produces a value between 0.0 and 1.0, which is then multiplied by its weight.

### Outdoor Plants (6 dimensions)

| Dimension | Weight | What it measures |
|-----------|--------|------------------|
| Hardiness | 30% | Can the plant survive the coldest winters at this location? |
| Soil type | 15% | Does the soil type match what the plant needs? |
| Soil pH | 15% | Is the pH range compatible? |
| Drainage | 15% | Does the drainage match the plant's preference? |
| Pollution tolerance | 15% | Can the plant handle the local air quality? |
| Water hardness | 10% | Can the plant tolerate the local water hardness? |

**Hardiness override:** If `hardinessScore < 0.2`, the final weighted score is capped at 30%. This prevents plants that cannot survive the local winters from scoring highly on other dimensions alone.

### Indoor Plants (2 dimensions)

| Dimension | Weight | What it measures |
|-----------|--------|------------------|
| Pollution tolerance | 50% | Indoor air quality impact |
| Water hardness | 50% | Tap water used for watering |

Indoor plants skip hardiness, soil, pH, and drainage since they are not exposed to outdoor conditions.

## Dimension Scoring Rules

### Hardiness

Uses the RHS Hardiness Scale (H1a through H7, where H7 is the hardiest). Compares the plant's minimum hardiness zone against the site's zone.

| Condition | Score |
|-----------|-------|
| Plant zone <= site zone (can survive) | 1.0 |
| 1 zone too tender | 0.6 |
| 2 zones too tender | 0.3 |
| 3+ zones too tender | 0.0 |

The RHS hardiness zone is derived from the historical winter minimum temperature:

| Min Temp (C) | Zone | Description |
|--------------|------|-------------|
| > 15 | H1a | Under glass all year |
| > 10 | H1b | Can be grown outside in summer |
| > 5 | H1c | Can be grown outside in summer |
| > 1 | H2 | Tolerant of low temperatures |
| > -5 | H3 | Hardy in coastal/mild areas |
| > -10 | H4 | Hardy through most of the UK |
| > -15 | H5 | Hardy in most places |
| > -20 | H6 | Hardy in all of UK and northern Europe |
| <= -20 | H7 | Hardy in the harshest conditions |

### Soil Type

Compares the site's soil type against the plant's accepted soil types (comma-separated list).

| Condition | Score |
|-----------|-------|
| Plant accepts "any" | 1.0 |
| Site type is in the plant's list | 1.0 |
| Plant accepts 3+ types (but not this one) | 0.6 |
| Plant accepts 2 types (but not this one) | 0.45 |
| Plant accepts only 1 type (and it's different) | 0.3 |

### Soil pH

Uses a simple scale: acid (0) - neutral (1) - alkaline (2). Measures the distance between the plant's preferred pH and the site's pH.

| Condition | Score |
|-----------|-------|
| Plant prefers "any" | 1.0 |
| Exact match | 1.0 |
| 1 step apart (e.g. acid vs neutral) | 0.6 |
| 2 steps apart (acid vs alkaline) | 0.25 |

### Drainage

Uses a ranked scale: free (1) - moist (2) - impeded (3) - waterlogged (4). Measures the minimum distance between the plant's accepted drainage types and the site's drainage.

| Condition | Score |
|-----------|-------|
| Plant accepts "any" | 1.0 |
| Exact match | 1.0 |
| 1 rank apart | 0.6 |
| 2 ranks apart | 0.35 |
| 3 ranks apart | 0.2 |

### Pollution Tolerance

Considers whether the plant is pollution-tolerant and the European AQI at the site.

| Condition | Score |
|-----------|-------|
| Plant is pollution-tolerant | 1.0 |
| AQI <= 20 (Good) | 1.0 |
| AQI 21-40 (Fair) | 0.8 |
| AQI 41-60 (Moderate) | 0.5 |
| AQI 61-80 (Poor) | 0.25 |
| AQI > 80 (Very Poor) | 0.1 |

### Water Hardness

Considers whether the plant tolerates hard water and the local hardness in PPM.

| Condition | Score |
|-----------|-------|
| Plant is hard-water-tolerant | 1.0 |
| Hardness <= 100 PPM (soft) | 1.0 |
| 101-200 PPM (moderate) | 0.7 |
| 201-300 PPM (hard) | 0.4 |
| > 300 PPM (very hard) | 0.2 |

## Final Score and Labels

The weighted score is converted to a percentage (0-100) and assigned a label:

| Score Range | Label |
|-------------|-------|
| 85-100 | Perfect Match |
| 70-84 | Great Match |
| 55-69 | Good Match |
| 35-54 | Worth Trying |
| < 35 | Excluded (not shown) |

The minimum threshold of 35 prevents plants that are clearly unsuitable from appearing in the results.

## Example Calculation

A Lavender plant at a London property with clay soil, neutral pH, moist drainage, H4 hardiness zone, AQI 35, and water hardness 280 PPM:

| Dimension | Raw Score | Weight | Contribution |
|-----------|-----------|--------|-------------|
| Hardiness (H4 needs H4) | 1.0 | 0.30 | 0.30 |
| Soil (prefers sand/chalk, site has clay) | 0.45 | 0.15 | 0.068 |
| pH (prefers alkaline, site is neutral) | 0.6 | 0.15 | 0.09 |
| Drainage (prefers free, site is moist) | 0.6 | 0.15 | 0.09 |
| Pollution (tolerant) | 1.0 | 0.15 | 0.15 |
| Water (tolerant) | 1.0 | 0.10 | 0.10 |

**Total: 0.798 -> 80% -> "Great Match"**
