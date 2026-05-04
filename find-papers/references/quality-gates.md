# Quality Gates

Use this file before final selection, exclusion, venue/status claims, evidence decisions, and full-text decisions.

## Hard Rules

### Abstract Reading is Mandatory

Every paper that appears in the final report — core recommendations, extended references, supplementary tables — must have its abstract read. No exceptions. An unread abstract means the paper cannot appear in the report at all.

How the abstract is read (arXiv API, OpenAlex abstract field, Semantic Scholar, publisher page, direct fetch) does not matter — what matters is that relevance and contribution were judged from the abstract, not from metadata or title alone.

The ToolLLM failure mode to avoid: if a candidate has a relevant title or identifier signal, open the abstract before excluding it or including it. Never judge inclusion/exclusion from metadata alone.

### Full-Text Reading is a Value Judgment

Read the full text (or key sections) of a paper when it is worth it — when the paper's importance or value to the user's task justifies the cost.

The decision is: **is this paper important enough that its method details, experimental findings, or limitations would directly shape the user's understanding, decision, or next step?**

Concretely, read full text when at least one of these holds:

- The paper is a survey that defines the landscape the user needs to understand.
- The paper is a foundational work whose method details the user would cite or build on.
- The paper's experimental claims or benchmark results are central to the user's question.
- The paper is a key benchmark that defines how the field evaluates work.
- The user explicitly asked for detailed review, method comparison, or evidence strength.
- There is a conflict or ambiguity across sources that only the body text can resolve.
- The user will use the report for a concrete citation, reproduction, or implementation decision.

When full text is not worth it, mark the paper as "已阅读摘要" and do not make claims about method internals, experiments, or limitations.

### Fetch Means Read

Do not fetch a paper's full text unless you intend to read at least the introduction and one key section (method, results, or framework). "Fetched but not read" is wasted cost. If the reading budget is exhausted, do not fetch — downgrade to abstract-only and state the reason.

Before fetching, order the candidates by reading priority:

1. Surveys that define the landscape
2. Foundational papers whose details shape everything else
3. Key benchmarks that define evaluation standards
4. Papers the user explicitly asked about
5. Papers central to the user's specific scenario

Allocate the reading budget in this order. If budget runs out, remaining papers stay at "已阅读摘要".

### Reading Budget

No fixed quota. Read what is worth reading. As a rough guide, most survey tasks will read 3-6 papers in full, and at minimum the top 1-2 most important papers.

If budget is constrained (context window, time), state it in the report's "其他事项" section: which papers were read in full, which were read via abstract only, and why.

## Venue and Status Verification

Canonical sources include:

- ACL Anthology for ACL, EMNLP, NAACL, Findings, COLING-style anthology records.
- OpenReview for ICLR and some workshop/conference decisions.
- Official conference proceedings pages for NeurIPS, ICML/PMLR, AAAI, IJCAI, SIGIR, KDD, WWW, CHI, UIST.
- Publisher landing pages for journal articles.
- DBLP as a useful CS bibliographic cross-check, not the sole final authority.
- Crossref for DOI/publisher metadata, but verify conference identity when Crossref records are ambiguous.

If status cannot be verified through a canonical source, write "venue/status 未核验". Do not guess from arXiv comments, community memory, or OpenAlex alone.

## Deduplication

Identity priority:

1. DOI
2. PMID/PMCID
3. arXiv/bioRxiv/medRxiv ID
4. Semantic Scholar or OpenAlex work ID
5. Normalized title + year + first author

Keep version notes when useful:
- Preprint vs accepted version
- Conference vs journal extension
- Dataset/benchmark paper vs leaderboard/blog/project page
- arXiv version with later formal venue
- Author manuscript vs version of record
- Withdrawn, retracted, superseded, or non-peer-reviewed status

## Selection Rubric

Use internally; do not show scores or criteria to the user.

| Criterion | Prefer |
|---|---|
| Relevance | Directly answers the user's brief |
| Contribution | Foundation, survey, method, dataset, benchmark, critique |
| Quality | Appropriate venue, publisher, peer-review status, and field reputation |
| Reliability | Verified metadata, appropriate evidence depth |
| Coverage | Diverse branches instead of one cluster |
| Recency | Current work plus classics |
| Influence | Citation context, adoption, benchmark or dataset use |
| Access | Accessible abstract is mandatory; full text or code/data is a bonus |
| Practical value | Helps the user read, cite, compare, or reproduce |

Select and rank by the user's goal, not by citation count alone.

## Recommendation Rules

- Priority reads should mix survey/context papers, foundational papers, and directly relevant recent papers when the topic supports that mix.
- Core recommendations should prioritize verified papers over unverified discoveries.
- Latest-progress sections may include preprints and web-discovered items, but must mark publication and verification status clearly.
- If a paper is included despite weak verification, explain the uncertainty in the "其他事项" section.
- Do not merge duplicate records when identifiers disagree and title similarity is weak; keep them separate until verified.
