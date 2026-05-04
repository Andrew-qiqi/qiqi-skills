# API Setup and Usage

API keys are optional. Missing keys should not block normal searching. Explain setup only when useful, such as when the user asks, a provider was skipped, or all stronger sources are unavailable.

## Environment Variables

| Variable | Unlocks | Required? |
|---|---|---|
| `EXA_API_KEY` | Exa search/content retrieval for LLM/web semantic discovery | Optional |
| `SERPAPI_API_KEY` | SerpApi Google Scholar supplement and account usage checks | Optional |
| `SERPER_API_KEY` | Serper Google Scholar supplement | Optional |
| `S2_API_KEY` | Semantic Scholar authenticated requests | Optional |
| `SEMANTIC_SCHOLAR_API_KEY` | Alternate Semantic Scholar key name | Optional |
| `NCBI_EMAIL` | Responsible PubMed/PMC usage | Recommended for PubMed |
| `NCBI_API_KEY` | Higher NCBI rate limits | Optional |
| `UNPAYWALL_EMAIL` | Unpaywall OA lookup | Recommended for Unpaywall |
| `CORE_API_KEY` | CORE API search/full-text discovery | Optional |

## User-Facing Setup Guidance

Keep setup guidance short:

- What the provider adds.
- Whether it is optional.
- Which environment variable to set.
- Whether a reliable quota check is available.

Example:

```md
可选增强：配置 `SERPAPI_API_KEY` 后，我可以补充 Google Scholar 风格结果，并通过 SerpApi Account API 查看本月剩余额度。没配置也可以继续用 OpenAlex、Crossref、arXiv、PubMed 等开放源检索。
```

## Usage Reporting

Show usage in the final report when relevant:

```md
## Source Usage
- OpenAlex: used, 4 requests, ok
- Semantic Scholar: tried, rate-limited once, partial results used
- Exa: used, 2 searches + 3 content fetches
- SerpApi Scholar: used, 6 searches, 244 monthly searches left
- PubMed: skipped, topic not biomedical
```

Rules:

- Show request counts when known.
- Show remaining quota only when the provider exposes it reliably.
- If quota cannot be queried, write `remaining quota unavailable from API`.
- Do not estimate or fabricate remaining quota.
- Do not show raw keys, account emails, or secrets.

## Known Provider Behavior

- SerpApi Account API can report monthly limit, monthly usage, and remaining searches. Account checks do not count toward search quota.
- Exa has API-key usage reporting, but it may require team-management credentials and an API key id.
- Semantic Scholar has rate limits and API-key stability benefits, but no simple remaining monthly quota.
- Serper advertises free queries and Scholar support; if a reliable balance endpoint is unavailable, report quota as unavailable.
