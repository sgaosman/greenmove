# GreenMove Documentation

A Rightmove companion app that recommends plants based on real environmental conditions at any UK property.

## Quick Links

| Document | Description |
|----------|-------------|
| [[01-overview]] | Purpose, target audience, and feature summary |
| [[02-architecture]] | System architecture, component layout, and data flow diagrams |
| [[03-data-model]] | Database schema and table relationships |
| [[04-scoring-algorithm]] | Plant suitability scoring: weights, dimensions, and thresholds |
| [[05-api-reference]] | All HTTP endpoints with request/response formats |
| [[06-external-dependencies]] | External APIs, rate limits, and fallback behaviour |
| [[07-decisions]] | Architecture Decision Records (ADRs) |
| [[08-risks]] | Security, performance, operational, and reliability risks |
| [[09-future-features]] | Roadmap and planned enhancements |
| [[10-deployment]] | Render hosting setup, environment variables, and keep-alive |
| [[11-troubleshooting]] | Common failure modes and debugging steps |

## Tech Stack

- **Language:** Java 21
- **Framework:** Spring Boot 3.3.2, Thymeleaf
- **Database:** SQLite (auto-created and seeded on startup)
- **Frontend:** Server-rendered HTML, vanilla CSS and JavaScript
- **Build:** Gradle 8.10
- **Hosting:** Render (free tier, Docker)

## Repository

Source code: `github.com/sgaosman/greenmove`
Hosted instance: `greenmove-k7zm.onrender.com`
