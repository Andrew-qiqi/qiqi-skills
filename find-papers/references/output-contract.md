# Output Contract

Reports are for the user. Do not show search machinery, internal labels, raw logs, or process noise. The user wants to know what to read and why.

## Default Report Structure

Four sections, always in this order:

### 1. 检索范围

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

### 3. 综合分析

Based on the papers found and read, analyze and answer the user's research question. This section does three things:

**判断**：对调研主题给出基于文献的判断——该领域的方法共识是什么、主流路线有哪些、核心瓶颈在哪里。每条判断必须引用具体论文作为依据（如"Toolformer（Schick et al., 2023）首次证明了自监督工具学习的可行性"），不能在没有任何一篇论文支撑的情况下做断言。

**演进逻辑**：梳理文献之间的承接或对立关系。谁回应了谁的问题？哪个 benchmark 暴露了哪个方法的缺陷？后来的方法如何解决？对读者而言，这才是文献列表本身无法替代的价值。

**建议**：基于上述分析，给读者实用的后续方向——从哪几篇入手、关注哪个方向的前沿、注意哪些已知局限。

This section must be grounded in the papers found during this search, not in prior knowledge. It is the one place where synthesis and judgment are expected.

### 4. 补充说明

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
- 检索范围
- 优先阅读（3-5 篇）
- 核心论文（grouped by theme）
- 阅读路线
- 补充说明

**Method comparison:**
- 检索范围
- Question being answered
- Compared papers
- method / data / metric / result / limitation table
- Full-text status for all core comparisons

**Evidence brief:**
- 检索范围
- Bottom-line answer
- Strongest supporting papers
- Conflicting or limiting papers
- Evidence depth and confidence limits

**Related-work map:**
- 检索范围
- Topic clusters with chronology
- Representative papers per cluster
- Suggested paragraph structure for writing

**Bibliography/export:**
- Provide requested identifiers or citation format
- Do not add prose unless useful
