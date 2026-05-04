# Output Contract

Default output is a practical Markdown report. Do not show raw provider JSON, raw scores, request URLs, or internal routing details unless the user asks for reproducibility, debugging, or export.

## Default Report

```md
# Literature Search Report: <topic>

## 检索摘要
- 主题：
- 目标：
- 时间范围：
- 文献类型：
- 使用数据源：
- 覆盖限制：

## 先读这几篇
| Priority | Paper | Year | Venue | Type | Why read it | Link |
|---|---|---:|---|---|---|---|

## 核心论文列表
| # | Title | Authors | Year | Venue | Type | DOI / URL | Notes |
|---|---|---|---:|---|---|---|---|

## 综述 / Survey
| Title | Year | Venue | Scope | Link |
|---|---:|---|---|---|

## 最新进展
| Title | Year | Venue / Source | Contribution | Status |
|---|---:|---|---|---|

## 阅读路线
1. 先读：
2. 再读：
3. 深入方向：

## 检索覆盖与数据源状态
- OpenAlex:
- Semantic Scholar:
- Exa:
- Google Scholar API:
- PubMed / DBLP / arXiv:
```

## Internal Record

Output this JSON only when the user asks for audit, reproducibility, debug, export, or provider diagnostics:

```json
{
  "search_brief": {
    "topic": "",
    "goal": "",
    "scope": "",
    "time_range": "",
    "paper_types": [],
    "venues": [],
    "language_scope": "",
    "minimum_results": 10,
    "quality_preference": "",
    "full_text_required": false,
    "output_shape": ""
  },
  "queries": [],
  "providers": [
    {
      "name": "openalex",
      "role": "primary metadata recall",
      "status": "used",
      "requests": 0,
      "results": 0,
      "quota_remaining": null,
      "rate_limit_notes": "",
      "coverage_notes": ""
    }
  ],
  "candidates": [],
  "deduplicated_papers": [],
  "selected_papers": [],
  "coverage_warnings": []
}
```

## Practicality Rules

- Explain why to read a paper instead of exposing internal scores.
- Put surveys/reviews in their own section when available.
- Put preprints and unverified web discoveries in `Status` or `Notes`.
- Include source failures only when they affect coverage or reproducibility.
- Prefer DOI and stable publisher/arXiv/PubMed/OpenAlex/Semantic Scholar links over search-result URLs.
