---
name: find-some-paper
description: Use when finding, searching, screening, comparing, or synthesizing scholarly papers, literature, reviews, surveys, related work, citation trails, reading lists, or academic sources across fields. Confirms the user's search brief first, then orchestrates OpenAlex, Semantic Scholar, Crossref, PubMed/PMC, DBLP, arXiv-family preprints, Unpaywall/CORE, Google Scholar-style APIs, and Exa/web semantic discovery when available.
---

# Find Some Paper

## Core Rule

Before executing any search, confirm the user's Search Brief. If the user already gave enough detail, restate it concisely and ask for confirmation. If key details are missing, ask focused questions before searching.

Do not require API keys to begin. Use configured providers when available; skip or mark unavailable providers when credentials, network access, or quota are missing.

## Workflow

1. **Confirm Search Brief**
   - Read `references/search-brief.md` when the request is broad, ambiguous, high-stakes, or asks for a structured literature search.
   - Confirm topic, goal, time range, paper types, venues, language scope, minimum result count, quality preference, full-text needs, and output shape.

2. **Plan Provider Routing**
   - Read `references/source-routing.md` before multi-source searches or when deciding which providers matter.
   - Treat OpenAlex, Crossref, Semantic Scholar, PubMed, DBLP, and publisher records as metadata authorities.
   - Treat Exa and Google Scholar-style providers as discovery layers until metadata is verified elsewhere.

3. **Search Opportunistically**
   - Use providers that are currently available.
   - If Semantic Scholar is rate-limited or blocked, back off when reasonable; otherwise continue with other sources.
   - If SerpApi, Serper, Exa, CORE, or other optional providers are not configured, mark them `not configured` and continue.

4. **Verify, Deduplicate, and Select**
   - Read `references/ranking-dedup.md` before presenting final recommendations.
   - Do not fabricate DOI, venue, citation counts, authors, abstracts, links, or full-text availability.
   - Mark preprints, non-peer-reviewed papers, duplicate versions, and web-discovered unverified items explicitly.

5. **Report**
   - Read `references/output-contract.md` before producing a report.
   - Default to a practical Markdown report: search summary, must-read papers, core list, survey list, latest progress, reading route, and provider status.
   - Hide raw scoring, raw JSON, request URLs, and internal routing details unless the user asks for reproducibility, debugging, or export.

6. **API Setup and Usage**
   - Read `references/api-setup-and-usage.md` when the user asks about API keys, setup, quota, provider health, or why a provider was skipped.
   - Show remaining quota only when the provider exposes it reliably. Otherwise say `remaining quota unavailable from API`.

## Default Search Assumptions

When the user leaves details unspecified:

- English-first search.
- Recent five years plus classic papers.
- Journals and conferences both included.
- Reviews/surveys listed separately when found.
- Preprints allowed but clearly marked.
- At least 10 final papers.
- Markdown report with tables.
- OpenAlex, Semantic Scholar, Crossref, and Exa considered first, with specialized sources routed by domain.

## Failure Behavior

- Missing key: mark `not configured`, continue.
- Rate limit: retry/back off when reasonable, then mark partial or unavailable.
- Network/VPN block: mark unavailable, continue.
- All academic metadata sources fail: explain the blocker and ask whether to proceed with web-only discovery or wait for configuration.
- Web-only discovery cannot be verified: include only with explicit `web-discovered / unverified` status.
