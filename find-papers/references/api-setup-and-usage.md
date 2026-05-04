# API Setup and Usage

API keys are optional. Missing keys should not block normal searching when open or already configured providers can satisfy the confirmed plan. Explain setup only when the user asks, a provider was skipped, or missing provider access materially affects coverage.

## Environment Variables

| Variable | Unlocks | Required? |
|---|---|---|
| `OPENALEX_EMAIL` | Polite OpenAlex usage and contact metadata | Recommended |
| `S2_API_KEY` | Semantic Scholar authenticated requests | Optional |
| `SEMANTIC_SCHOLAR_API_KEY` | Alternate Semantic Scholar key name | Optional |
| `EXA_API_KEY` | Exa semantic web discovery and content retrieval | Optional |
| `SERPAPI_API_KEY` | Google Scholar-style discovery and account usage checks via SerpApi | Optional |
| `SERPER_API_KEY` | Google Scholar-style discovery via Serper | Optional |
| `NCBI_EMAIL` | Responsible PubMed/PMC usage | Recommended for PubMed/PMC |
| `NCBI_API_KEY` | Higher NCBI rate limits | Optional |
| `UNPAYWALL_EMAIL` | Unpaywall open-access lookup | Recommended for OA lookup |
| `CORE_API_KEY` | CORE repository search and full-text discovery | Optional |

## User-Facing Setup Guidance

Keep setup guidance short:

- What the provider adds.
- Whether it is optional for the current task.
- Which environment variable to set.
- Whether reliable quota reporting is available.

Example:

```md
可选增强：配置 `SERPAPI_API_KEY` 后，我可以补充 Google Scholar 风格结果。没配置也可以继续用 OpenAlex、Crossref、arXiv、PubMed/PMC 等开放源检索；Scholar-like 结果只会作为发现层，核心推荐仍需权威元数据和摘要核验。
```

## Usage Reporting

Mention provider status in conversational/window updates when it affects coverage:

```md
覆盖提示：Semantic Scholar 速率受限，我会用 OpenAlex + Crossref + arXiv/DBLP 补足候选池；这只影响召回，不改变核心论文的摘要核验要求。
```

In the default Markdown report, do not include request counts, quota, or provider-health tables. Include concise provider limitations only when they affect user trust, or when the user requested reproducibility, audit, export, debugging, or provider diagnostics.

Rules:

- Show request counts only when known and useful.
- Show remaining quota only when the provider exposes it reliably.
- If quota cannot be queried, write `remaining quota unavailable from API`.
- Do not estimate or fabricate remaining quota.
- Do not show raw keys, account emails, or secrets.

## Known Provider Behavior

- SerpApi Account API can report monthly limit, usage, and remaining searches; account checks do not count toward search quota.
- Semantic Scholar has rate limits and API-key stability benefits, but no simple remaining monthly quota.
- Exa usage reporting may require team-management credentials or API-key-specific access.
- Serper Scholar-style access may not expose a reliable balance endpoint; if so, report quota as unavailable.
