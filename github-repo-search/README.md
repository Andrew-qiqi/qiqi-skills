# github-repo-search

帮助用户搜索和筛选 GitHub 开源项目，输出结构化推荐报告。当用户说"帮我找开源项目"、"搜一下GitHub上有什么"、"找找XX方向的仓库"、"开源项目推荐"、"github搜索"、"/github-search"时触发。

## 版本

当前版本：V2.1

## Fork 来源

本 skill 基于 Skillstore 原始项目 fork / 改造：

- 原始 Skill：github-repo-search
- 原作者：yunshu0909
- 原始页面：[skillstore.io/skills/yunshu0909-github-repo-search](https://skillstore.io/skills/yunshu0909-github-repo-search)

## 当前维护信息

- 当前版本作者：cuteqiqi
- 当前改造版本：github-repo-search / V2.1

## V2.1 主要增强

相对原始版本，V2.1 增加了：

1. Exa.ai 语义搜索通道，与 GitHub Search API 关键词检索形成双通道召回。
2. LLM 查询扩展，将用户需求拆解为核心语义、同义替换、场景展开、技术映射和跨界联想查询。
3. 二阶段重排：先用元数据粗排，再对候选仓库 README 进行语义精排。
4. 双通道候选合并与去重，标记候选来源为 `github` / `exa` / `both`。
5. 主榜硬过滤保护：用户确认后的 stars、归档状态、公开性等硬过滤条件不能被精排阶段覆盖。
6. 低 star 但高价值项目单独展示：不进入 Top N 主榜，但可作为“潜力项目”说明其用户价值、成本和风险。

## 使用方式

当用户提出类似需求时触发：

- “帮我找开源项目”
- “搜一下 GitHub 上有什么”
- “找找 XX 方向的仓库”
- “开源项目推荐”
- “github 搜索”
- “/github-search”

## 输出目标

目标不是给出大量链接，而是产出用户可理解、可比较、可决策、可直接行动的候选仓库列表。

默认输出包括：

- 需求摘要
- 检索词清单
- 筛选与重排规则
- 结果总览
- Top N 单榜
- 低 star 但高价值项目 / 潜力项目（仅当存在时）
- 结论与下一步建议

## 支持工具

- claude
- codex
- claude-code
