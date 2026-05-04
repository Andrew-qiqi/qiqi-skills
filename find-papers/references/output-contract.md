# Output Contract

Reports are for the user. Do not show search machinery, internal labels, raw logs, or process noise. The user wants to know what to read and why.

## Default Report Structure

Three sections, always in this order:

### 1. 调研概况

The search parameters confirmed with the user at the start. 3-6 lines, no more:

```
- 主题：
- 目标：
- 时间范围：
- 文献类型：
- 目标规模：
- 检索来源：
```

Also note here if the user gave any special constraints (e.g. "只要会议论文", "重点关注 benchmark").

### 2. 调研结果

#### 优先阅读

If the user only has time for a few papers, which ones. A short scannable table:

| # | 论文 | 年份 | 类型 | 为什么先读 |
|---|---|---|---|---|
| 1 | ... | | | |

Or a concise numbered list. This is a practical shortcut for the busy reader.

#### 核心论文

Group by theme or direction. Use natural Chinese section headers:

- `方向一：奠基工作`
- `方向二：综述与框架`
- `方向三：Benchmark 与评估`
- `方向四：前沿方法`

Not "簇 1", "簇 2".

Each paper entry:

```
#### N. Paper Title
- **作者**：...
- **年份**：...
- **Venue/Status**：...（未核验的如实写"未核验"）
- **类型**：survey / method / benchmark / dataset / position / system
- **链接**：...
- **为什么入选**：（一段话）
- **阅读程度**：（一句话，自然语言。如"已阅读全文""已阅读摘要""已阅读引言和方法部分"）
```

Only "已阅读全文" or "已阅读XX部分" papers may describe method internals, experiments, or limitations. Papers read only via abstract must say so and must not make body-level claims.

#### 扩展参考

Papers worth knowing but not core. Table format, one line each:

| 论文 | 年份 | 类型 | 简要说明 |
|---|---|---|---|

#### 阅读路线

Organize by the user's likely goals:

```
### 入门路线（2-3 篇）
### 深入路线（4-6 篇）
### 做 Benchmark/评估
### 做 System Building
```

### 3. 其他事项

Only what affects the user's trust or decisions:

- Venue/status that could not be verified.
- Important papers only read via abstract, and why full text was not read.
- Coverage gaps that matter (sources unavailable, known missing papers).
- 2-4 concrete directions for further exploration.

## What NOT to Include

- Raw API request URLs or JSON
- Internal evidence labels like `[Full text checked: intro+method]`
- Provider status tables or request counts
- Search process narrative ("I searched X and got Y results...")
- Unactionable caveats
- Scores, rankings, or internal selection rubrics
- "Verified via Crossref + OpenAlex" as a substitute for reading

## Evidence Wording

Use natural language, not machine-facing tags:

Good:
- "已阅读全文"
- "已阅读引言和方法部分"
- "已阅读摘要"
- "元数据已核验，未阅读正文"

Bad:
- `[Full text checked: intro+method]`
- `[Metadata verified]`
- "Verified via Crossref + OpenAlex + arXiv"
- "arXiv PDF available"

## When to Include Process Details

Only add brief process notes when:
- A source failure materially affects coverage
- A venue/status cannot be resolved and the user needs to know
- Full text was needed for an important paper but unavailable
- The user explicitly asked for reproducibility or debugging info

## Output Variants

Adapt the default structure to the user's request:

**Reading list:**
- 调研概况
- 优先阅读（3-5 篇）
- 核心论文（grouped by theme）
- 阅读路线
- 其他事项

**Method comparison:**
- Question being answered
- Compared papers
- method / data / metric / result / limitation table
- Full-text status for all core comparisons

**Evidence brief:**
- 调研概况
- Bottom-line answer
- Strongest supporting papers
- Conflicting or limiting papers
- Evidence depth and confidence limits

**Related-work map:**
- Topic clusters with chronology
- Representative papers per cluster
- Suggested paragraph structure for writing

**Bibliography/export:**
- Provide requested identifiers or citation format
- Do not add prose unless useful
