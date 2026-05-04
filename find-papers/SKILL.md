---
name: find-papers
description: Use when finding scholarly papers, literature surveys, reading lists, related work, citation trails, method comparisons, benchmark papers, evidence reviews, or academic sources across fields.
---

# Find Papers

Find the most useful and trustworthy papers under an explicit search and evidence budget. Core recommendations must be checked beyond raw metadata, full text is read only when the user's conclusion depends on paper-body details, and reports should help the user decide what to read or cite.

## Core Rules

0. **Task-level search plan checkpoint by default.** Before starting a paper-finding task, present one concise search plan and wait for user confirmation. The only exception is when the user explicitly says to start immediately, use defaults without confirmation, or skip confirmation. After confirmation, execute searches, API calls, citation lookups, metadata verification, and planned full-text escalations autonomously within that plan. Do not ask before each sub-search or provider call. Ask again only if execution requires materially changing the confirmed plan.
1. **Budgeted search, not exhaustive search by default.** Do enough searching to satisfy the user's goal and stated output size. Do not pursue saturation unless the user explicitly asks for a systematic or exhaustive review.
2. **Abstract reading is mandatory.** Every paper that appears in the final report — core, extended, supplementary — must have its abstract read. No exceptions. An unread abstract means the paper cannot appear in the report at all.
3. **Full text is a value judgment, not a default.** Read full text when the paper is important enough that its method details, findings, or limitations would directly shape the user's understanding or decision. Do not fetch unless you intend to read at least intro + one key section. "Fetched but not read" is wasted cost.
4. **Metadata verification is not evidence depth.** Do not label "Verified via OpenAlex/Crossref/arXiv" as if the paper content was read.
5. **Venue/status claims need authority.** If a final report names a formal venue or publication status, verify it with a canonical source or mark it unverified.
6. **User-facing output.** Show what helps the user read, cite, compare, or decide. Hide raw provider logs, request URLs, internal scores, and search-process noise unless the user asks for reproducibility or debugging.

## Workflow

### 1. Clarify Brief and Budget

Read `references/workflow.md`, infer any harmless defaults, present the search plan, and wait for confirmation before searching. If required fields are missing, ask concise questions before presenting the plan.

Default budget when unspecified:

- Final output: 10-15 core papers.
- Search: 3-5 query variants across 2-4 authoritative sources.
- Candidate pool: about 2-3x the final output size.
- Evidence: all core recommendations abstract checked; full text only for escalation triggers.

### 2. Search and Verify

Read `references/source-routing.md` before multi-source searches or when deciding which provider families matter. Use official or stable academic sources first. Treat web and Google-Scholar-like results as discovery signals until verified elsewhere.

Do not start provider routing, API calls, web searches, citation searches, or full-text fetching until the user has confirmed the task-level search plan. After confirmation, do not interrupt for per-provider or per-query approval unless the plan needs a material change.

### 3. Screen, Deduplicate, and Escalate Evidence

Read `references/quality-gates.md` before final selection, exclusion of a suspected core paper, venue/status claims, or any full-text decision.

Evidence labels for internal tracking (see `references/quality-gates.md`). In the user-facing report, use natural language: "已阅读全文", "已阅读引言和方法部分", "已阅读摘要", not machine-facing tags.

Only papers read in full may support claims about method internals, experimental setup, quantitative findings, limitations, benchmark construction, or failure analysis. Papers read only via abstract must say so and must not make body-level claims.

### 4. Fetch Full Text When Needed

Use the bundled helper. Do not hand-roll PDF downloads or pass raw PDFs to the file reader. Read `references/api-setup-and-usage.md` when the user asks about API keys, skipped providers, provider health, quota, or full-text access setup.

```bash
SKILL_DIR="/path/to/find-papers"
"$SKILL_DIR/scripts/fetch_and_parse" "<doi|arxiv_id|pmid|pmcid|url>"
```

Set `OPENALEX_EMAIL` and ideally `UNPAYWALL_EMAIL` when available. Useful optional variables include `S2_API_KEY`, `SEMANTIC_SCHOLAR_API_KEY`, `NCBI_API_KEY`, `NCBI_EMAIL`, `EXA_API_KEY`, `SERPAPI_API_KEY`, `SERPER_API_KEY`, and `CORE_API_KEY`.

The helper caches parsed Markdown at `~/.cache/find-papers/` and prints JSON with `status`, `parsed_path`, `source`, and `tried`.

### 5. Report for the User

Read `references/output-contract.md` before final output. The report has three sections:

1. **调研概况** — the search parameters confirmed with the user (topic, time range, paper types, target size, sources).
2. **调研结果** — priority reads, core papers grouped by theme, extended references, reading routes.
3. **其他事项** — only the limitations that affect user trust or decisions, plus directions for further exploration.

Use natural language for evidence depth ("已阅读全文", "已阅读摘要"). Do not show machine-facing tags, raw logs, or search process. Do not add a provider-status table to the default Markdown report unless the user asked for reproducibility, audit, export, debugging, or provider diagnostics.

## Failure Behavior

- Missing key: mark source `not configured` internally and continue with available sources.
- Rate limit or block: back off when reasonable, then mark coverage partial only if it affects the result.
- All metadata sources fail: explain the blocker and ask whether to continue with web-only discovery.
- Web-only candidates: include only with explicit `web-discovered / unverified` status, and keep them out of core recommendations unless the uncertainty is central to the task.
