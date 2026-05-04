# Source Routing

Use this file before multi-source searches, provider-family selection, or fallback decisions. Keep `find-papers` evidence gates intact: provider coverage improves recall, but core recommendations still require abstract checks and body-level claims still require full-text checks.

## Authority Layers

| Source | Use for | Authority level |
|---|---|---|
| OpenAlex | Broad recall, DOI/OA metadata, topic expansion | metadata authority |
| Semantic Scholar | Semantic relevance, citations, related papers, influential citations | metadata authority; rate-limit prone |
| Crossref | DOI, publisher, title validation | metadata authority, not primary relevance search |
| PubMed/PMC | Biomedical and life-science metadata; PMC full text | domain authority |
| DBLP | Computer science venue and author normalization | bibliographic authority |
| arXiv | CS, math, physics, statistics, and quantitative preprints | preprint authority |
| bioRxiv/medRxiv | Biology and medical preprints | preprint authority |
| ACL Anthology | ACL, EMNLP, NAACL, Findings, COLING-style records | canonical venue source |
| OpenReview | ICLR and some workshop/conference decisions | canonical venue source |
| Official proceedings or publisher pages | Formal venue/status, journal version, proceedings record | canonical venue source |
| Unpaywall/CORE | Legal open-access copy discovery | access sources |
| Exa/web/Scholar-like APIs | Project pages, author/lab pages, PDFs, grey recall, query expansion | discovery only; verify elsewhere |

## Routing Defaults

- General scholarly topic: OpenAlex + Semantic Scholar + Crossref validation; add Exa/web only for discovery gaps or query expansion.
- Computer science: OpenAlex + Semantic Scholar + DBLP + arXiv; add canonical proceedings pages for final venue/status.
- NLP: add ACL Anthology for ACL-family venue/status and full records.
- ML: add OpenReview for ICLR and official NeurIPS/ICML/PMLR/ICLR pages for final status.
- Biomedicine/life sciences: PubMed/PMC + OpenAlex + Crossref; add bioRxiv/medRxiv when preprints are allowed.
- Engineering/robotics: OpenAlex + Semantic Scholar + Crossref + arXiv; add venue filters or official pages for IEEE, Science Robotics, ICRA, IROS, RSS, TRO, IJRR when requested.
- Social science/law/finance: OpenAlex + Crossref + SSRN or web discovery when useful; mark grey literature clearly.
- Chinese-language search: combine English scholarly sources with requested Chinese databases or web discovery when available; state coverage limits when they affect trust.

## Verification Rule

Treat Exa, Google Scholar-style providers, and general web search as discovery layers. Verify discovered candidates through an authority source before including them as core recommendations. If a candidate remains web-only, mark it `web-discovered / unverified` and keep it out of core recommendations unless the uncertainty itself is central to the user's task.

## Fallback Rule

- Missing credentials: mark the source `not configured` internally and continue with available sources.
- Rate limit or block: back off when reasonable, then mark the source `partial` or `unavailable` internally.
- Domain source unavailable: continue with broader metadata authorities and mention the coverage limitation only if it affects trust.
- All academic metadata sources fail: explain the blocker and ask whether to continue with web-only discovery or wait for configuration.

Provider status may be mentioned briefly in conversational/window updates when it affects coverage. Do not add a provider-status table to the default Markdown report unless the user asks for reproducibility, audit, export, debugging, or provider diagnostics.
