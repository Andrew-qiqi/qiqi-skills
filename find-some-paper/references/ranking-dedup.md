# Ranking and Deduplication

## Deduplication Identity Priority

1. DOI
2. PMID or PMCID
3. arXiv, bioRxiv, or medRxiv identifier
4. Semantic Scholar paper ID or OpenAlex work ID
5. Google Scholar cluster ID when available
6. Normalized title plus publication year plus first author

Normalize titles by lowercasing, trimming punctuation, collapsing whitespace, and removing obvious version suffixes. Do not merge records when title similarity is weak and identifiers disagree.

## Verification Rules

- Do not invent missing metadata.
- Prefer verified metadata from OpenAlex, Crossref, Semantic Scholar, PubMed/PMC, DBLP, arXiv-family APIs, or publisher pages.
- Treat Exa and Scholar-provider results as discovery signals until verified.
- Mark unverifiable web-only candidates as `web-discovered / unverified`.
- Mark preprints, non-peer-reviewed papers, accepted versions, published versions, and duplicate versions clearly.

## Selection Rubric

Use these internal criteria, but do not show raw scores by default:

| Criterion | What to look for |
|---|---|
| Relevance | Direct match to the Search Brief and subtopics |
| Contribution | Foundation, method, dataset, benchmark, application, survey, critique |
| Quality | Venue, publisher, peer-review status, field reputation |
| Recency | New work within requested or default time range |
| Influence | Citation count, influential citations, adoption, benchmark use |
| Coverage | Avoid all papers coming from one branch unless requested |
| Access | Full text, open access, reproducible artifacts |
| Reliability | Metadata verified by authority source |

## Recommendation Rules

- `先读这几篇` should mix survey/context papers, foundation papers, and directly relevant recent papers.
- `核心论文列表` should prioritize verified papers over unverified discoveries.
- `最新进展` may include preprints and web discoveries, but must mark status clearly.
- When a paper is included despite weak verification, explain the uncertainty in `Notes`.
