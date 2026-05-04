# Source Routing

Use providers opportunistically. No single provider is required. Separate metadata authorities from discovery sources.

## Provider Roles

| Provider | Role | Use when | Notes |
|---|---|---|---|
| OpenAlex | Primary broad metadata recall | General scholarly search, venue/source filtering, OA metadata, DOI discovery | Prefer for broad recall |
| Semantic Scholar | Semantic relevance, citations, recommendations | Citation graph, author search, related papers, influential citations | Try with or without key; back off on rate limits |
| Crossref | DOI and publisher validation | DOI lookup, publisher metadata, title/DOI confirmation | Do not use as main relevance search |
| PubMed/PMC | Biomedical metadata and full text | Medicine, biology, clinical, life sciences | Use PMID/PMCID and PMC full text when relevant |
| DBLP | Computer science venue and author normalization | CS conferences, proceedings, author disambiguation | Useful for conference-heavy topics |
| arXiv | Preprints | CS, physics, math, statistics, quantitative biology, quantitative finance | Mark as preprint unless published version verified |
| bioRxiv/medRxiv | Preprints | Biology and medical preprints | Mark as preprint |
| Unpaywall | Open-access lookup | Finding legal OA copies by DOI | Requires email parameter |
| CORE | Full-text discovery | Open-access repository search | Requires key for full API use |
| SerpApi Scholar | Google Scholar-style discovery and usage reporting | Cited-by, all versions, PDFs, grey recall | Metadata must be verified elsewhere |
| Serper Scholar | Google Scholar-style discovery | Alternative Scholar provider | Metadata must be verified elsewhere |
| Exa | LLM/web semantic discovery | Project pages, author/lab pages, PDFs, web-visible papers, query expansion | Discovery layer, not final metadata authority |

## Routing Defaults

- General topic: OpenAlex + Semantic Scholar + Crossref validation + Exa discovery.
- Computer science: OpenAlex + Semantic Scholar + DBLP + arXiv + Exa; add Scholar provider for missed venues or PDFs.
- Biomedicine/life sciences: PubMed/PMC + Semantic Scholar + OpenAlex + Crossref; add bioRxiv/medRxiv when preprints are allowed.
- Engineering/robotics: OpenAlex + Semantic Scholar + Crossref + arXiv + Exa; add venue filters for IEEE, Science Robotics, ICRA, IROS, RSS, TRO, IJRR when requested.
- Social science/law/finance: OpenAlex + Crossref + SSRN/web search when available + Exa; mark grey literature clearly.
- Chinese-language search: use English sources plus requested Chinese databases or web discovery if available; clearly mark coverage limits.

## Authority Rule

OpenAlex, Crossref, Semantic Scholar, PubMed/PMC, DBLP, arXiv-family APIs, and publisher pages can support final metadata claims.

Exa, SerpApi Scholar, Serper Scholar, and general web search can discover candidates, PDFs, citations, and project pages. Verify discovered papers through an authority source before treating them as core recommendations.

## Fallback Rule

- If a source is missing credentials, mark `not configured`.
- If a source is blocked or rate-limited, mark `unavailable` or `partial`.
- Continue unless every viable academic metadata source fails.
