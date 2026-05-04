# Workflow

Use this file for search brief and budget selection. Use `source-routing.md` for provider routing and `api-setup-and-usage.md` for live API setup, provider health, quota, and skipped-provider explanations.

## Pre-flight API Check

Before presenting a search plan, check which API keys and env vars are available. This determines which sources can actually be used.

| Env var | Unlocks | Check |
|---|---|---|
| `EXA_API_KEY` | Exa semantic search | `env \| grep EXA_API_KEY` |
| `SERPAPI_API_KEY` or `SERPER_API_KEY` | Google Scholar search | `env \| grep -iE 'SERPAPI\|SERPER'` |
| `OPENALEX_EMAIL` | OpenAlex polite pool | `env \| grep OPENALEX_EMAIL` |
| `UNPAYWALL_EMAIL` | Unpaywall OA lookup | `env \| grep UNPAYWALL_EMAIL` |
| `S2_API_KEY` or `SEMANTIC_SCHOLAR_API_KEY` | Semantic Scholar (avoids 429) | `env \| grep -iE 'S2_API_KEY\|SEMANTIC_SCHOLAR_API_KEY'` |
| `NCBI_API_KEY` or `NCBI_EMAIL` | PubMed/PMC full text | `env \| grep -iE 'NCBI'` |
| `CORE_API_KEY` | CORE full-text discovery | `env \| grep CORE_API_KEY` |

When a key is missing, that source is unavailable — mention it in the search plan under "暂不覆盖" and proceed. Do not mark a source as "not configured" without actually checking its env var.

## Brief

Before starting a paper-finding task, present one concise task-level search plan and wait for user confirmation. Do this even when the user gave enough detail. The only exception is when the user explicitly says to start immediately, use defaults without confirmation, or skip confirmation.

After confirmation, execute searches, API calls, citation lookups, metadata verification, and planned full-text escalations autonomously within the confirmed plan. Do not ask before each sub-search, query variant, provider call, citation lookup, or planned full-text fetch.

If required information is missing, ask concise questions first. Once enough information exists, present the plan and wait.

Important fields:

| Field | Default |
|---|---|
| Topic | Ask if absent |
| Goal | Balanced reading list |
| Scope | Broad topic scope |
| Time range | Recent 5 years plus classics |
| Paper types | Conferences, journals, surveys; preprints marked |
| Language | English-first |
| Output size | 10-15 core papers |
| Evidence need | Abstract checked for core papers; full text on trigger |
| Output shape | User-facing Markdown report |

Ask clarifying questions before the plan when:

- The topic is absent or too broad to search responsibly.
- The user asks for systematic/exhaustive coverage with no scope.
- Venue, language, date, or domain constraints are central but missing.
- The requested output size or evidence depth would greatly change cost.

Do not execute immediately just because defaults are harmless. Infer those defaults, include them in the plan, and wait for confirmation.

## Search Plan Checkpoint

Use this shape before searching:

```md
我会按这个方案检索：

- 主题：
- 目标：
- 时间范围：
- 输出规模：
- 主要数据源：（只列当前可用的，不列缺 key 的）
- 查询方向：
- 验证标准：
- 全文读取策略：
- 暂不覆盖：（包括因缺 key 而不可用的源、以及故意的范围排除）

API 状态：（简述哪些源可用，哪些因缺 key 不可用）

请确认是否按这个方案开始；也可以告诉我要收窄或放宽哪里。
```

If important sources are unavailable due to missing keys, suggest the user set them:

> 提示：设置 `EXA_API_KEY` 可启用 Exa 语义搜索；设置 `SEMANTIC_SCHOLAR_API_KEY` 可避免 Semantic Scholar 限流。是否继续当前方案？

After presenting this checkpoint, stop and wait. Do not say you are beginning the search in the same response. Once the user confirms, proceed without asking for per-call approval.

Ask again only when execution requires a material plan change, such as:

- expanding output size substantially
- adding a new domain, language, or source family
- upgrading ordinary search to systematic/exhaustive review
- reading far more full text than planned
- changing inclusion/exclusion scope
- exceeding the stated time, cost, or coverage budget

## Budget

Default budget:

- 3-5 query variants.
- 2-4 relevant authoritative sources.
- Candidate pool about 2-3x final output size.
- Core recommendations at least abstract checked.

Expand budget only when the user asks for systematic review, exhaustive bibliography, citation graph tracing, or comprehensive related work. Explain the cost before expanding.

Stop when:

- The requested output size is filled with relevant, verified papers.
- Additional searches mostly return duplicates, weak matches, or already-covered branches.
- The remaining uncertainty can be stated as a coverage limitation.

## API Notes

Prefer official APIs via `curl` or platform tools. Use stable identifiers once found.

### Exa (semantic discovery)

When `EXA_API_KEY` is set, use Exa for discovery-layer searches — finding papers by concept, finding project pages, or locating PDFs. Exa is discovery only; verify all metadata through authority sources afterward.

```bash
# Search for papers
curl -s "https://api.exa.ai/search" \
  -H "Authorization: Bearer $EXA_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"query": "<search terms>", "numResults": 10, "type": "auto"}'
```

Use Exa to:
- Discover papers that keyword search might miss (semantic/conceptual matches)
- Find project pages, leaderboards, or technical reports
- Locate PDF URLs for hard-to-find papers

Never use Exa results as the sole source for venue, authors, or DOI. Always cross-check with authority sources.

### WebSearch (built-in fallback)

When Exa is unavailable and a discovery gap exists, use the built-in WebSearch tool. Same rule: web results are discovery signals, not authority sources.

### Full-text via fetch_and_parse

Full-text access goes through `scripts/fetch_and_parse`, which resolves DOI/arXiv/PMID/PMCID/URL through:

1. arXiv HTML/PDF
2. PMC XML/HTML
3. Unpaywall
4. OpenAlex OA locations
5. Semantic Scholar OA PDF
6. Crossref TDM links
7. DOI landing page
8. direct URL

The helper prints a `tried` log. Use it when explaining why full text was unavailable.
