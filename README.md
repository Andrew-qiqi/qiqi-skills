# qiqi-skills

Personal AI agent skills maintained by cuteqiqi.

## Skills

- `find-papers`: 文献检索、筛选、校验与结构化调研报告 skill。强制要求所有论文阅读 abstract，全文阅读基于重要性和价值判断，三段式用户面报告输出，支持多源检索与 venue 核验。
- `github-repo-search`: GitHub 开源项目搜索与筛选 skill，当前版本 V2.1。
- ~~`find-some-paper`~~ *(deprecated，已被 `find-papers` 替代)*

## Usage

Copy a skill directory into the target runtime's skills directory, for example:

- Claude Code: `.claude/skills/`
- Codex / agents runtime: `.agents/skills/`
