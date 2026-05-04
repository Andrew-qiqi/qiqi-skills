# Search Brief

Confirm a Search Brief before running searches. If the user already provided enough information, restate the brief and proceed after confirmation. If the request is vague, ask concise questions.

## Required Brief Fields

| Field | Meaning | Default if omitted |
|---|---|---|
| `topic` | Research topic, question, or problem | Ask if absent |
| `goal` | Beginner reading, survey, state of the art, related work, method comparison, dataset/benchmark discovery, citation tracing | Balanced reading list |
| `scope` | Included/excluded subtopics, domain boundaries, terminology | Broad topic scope |
| `time_range` | Years to include or prioritize | Recent 5 years plus classics |
| `paper_types` | Journals, conferences, reviews, surveys, preprints, books, dissertations, standards, reports | Journals + conferences + surveys; preprints marked |
| `venues` | Required/preferred journals, conferences, publishers, databases | No venue restriction |
| `language_scope` | English, Chinese, bilingual, or other languages | English-first |
| `minimum_results` | Target number of final papers | 10 |
| `quality_preference` | Top venues, recent work, highly cited classics, open access, theory, application, balanced | Balanced |
| `full_text_required` | Whether full text or open access is required | Prefer full text but do not require |
| `output_shape` | Reading list, comparison table, annotated bibliography, related-work map, BibTeX/DOI export, reproducibility appendix | Markdown report |

## Confirmation Template

Use this shape before searching:

```md
我先确认一下检索方向：
- 主题：
- 目标：
- 时间范围：
- 文献类型：
- 语言/地区：
- 指定期刊/会议/数据库：
- 至少输出：
- 偏好：

如果这个方向对，我就开始检索；如果要改，请告诉我要收窄或放宽哪里。
```

## When to Ask vs Infer

Ask when:

- The topic is absent or too broad to search responsibly.
- The user asks for a systematic review, related work, or comprehensive bibliography but gives no scope.
- Venue, language, or year constraints are central to the request but unspecified.
- The minimum result count or output format will change the work significantly.

Infer defaults, confirm, then proceed when:

- The topic and goal are clear enough.
- Missing fields can use defaults without distorting the search.
- The user asks for a quick shortlist.
