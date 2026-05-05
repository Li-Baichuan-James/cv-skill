# Resume Crafter Skill

<div align="center">

## 简历.skill

---

> 简历？ 易如反掌。

<img src="assets/cv-skill-readme.jpg" alt="简历？ 易如反掌。" width="220" />

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blueviolet)](https://claude.ai/code)
[![AgentSkills](https://img.shields.io/badge/AgentSkills-Standard-green)](https://agentskills.io)
[![Bilingual](https://img.shields.io/badge/README-中文%20%7C%20English-4c9a2a)](#中文)

[中文](#中文) | [English](#english)

</div>

---

## 中文

还在依赖网页版AI写简历？是不是经常遇到这些糟心问题：AI生成的内容复制回Word，格式变形、排版错乱，得花大量时间手动微调；AI从不主动向你确认信息，凭着脑补瞎编乱造，写出来的经历脱离实际、全是幻觉，根本没法直接投递；生成的简历格式全看天意，字体、间距、布局完全不受控制，想调整却无从下手？

简历.skill 正是为解决这些痛点而生——它是一套面向 OpenCode / Claude Code / Codex 等 agent 的简历制作全自动化工作流，用更专业、更可控的方式，帮你轻松制作高质量简历。

它的核心优势就是精准解决网页版AI的弊端：用LaTeX编写简历，直接交付精致、美观、紧凑的PDF文件，无需手动调整格式；遇到任何不确定的信息点，都会主动停下来逐一向你确认，彻底告别简历“幻觉”；内置多套精选模板，涵盖中文/英文、求职/学术、有/无头像照片等多种场景，格式完全可控，根据你的需求自动选择。

简单说：你负责提供真实经历，它负责把材料读清楚、问清楚、写清楚，最终直接交给你可以直接投递的 pdf 简历文件。

### 安装

复制这段话给 OpenCode / Claude Code / Codex 等 agent，一键配置：

```text
Fetch and follow instructions from:
https://raw.githubusercontent.com/Li-Baichuan-James/cv-skill/main/INSTALL.md
```

### 快速开始

1. 让 agent 按 `INSTALL.md` 完成安装与验证。

```text
https://raw.githubusercontent.com/Li-Baichuan-James/cv-skill/main/INSTALL.md
```

2. 在会话里自然描述需求即可。例如：

```text
帮我把这份旧简历改成 1-2 页的英文学术简历，用于phd申请。
```

3. 也可以直接说明语言、用途、风格、重点 等等。

```text
这份简历使用 中文/英文，用于求职/学术申请， 要/不要头像照片，重点突出科研项目和工程经历...
```

4. 正式动笔前，它会主动询问所有不确定的点，不会瞎猜/乱编。

5. 经你确认后，直接交给你可以直接投递的 pdf 简历文件，以及对应的latex源代码（方便后续修改更新）。


### 用户侧流程（你会看到什么）

1. Agent 先梳理信息：读取聊天、Word、PDF、截图或其他材料
2. 信息不清楚时会停下来问，不会硬猜
3. 起草前先整理需求、来源和约束
4. 简历中的最终表述会进入 `work/claim-source-map.md`
5. 交付时输出 `work/` 和 `output/`，方便复查和继续编译
6. 你会得到可以直接投递的 pdf 简历文件，以及对应的latex源代码


### 核心特性

- **事实优先**：先提取，后写作；缺信息就问，不靠脑补补齐
- **可追踪**：关键 claim 对应来源、位置、原始表述或用户确认
- **可复现**：`output/resume.tex` 和 `output/common/resume.cls` 放在一起，方便离线重编译
- **多模板**：支持 industry ATS、带照片版、research resume、中文标准模板
- **边界清楚**：只使用四个简历 skills，必要时配合 `docx` / `pdf` 读取源材料
- **可验证**：仓库提供 `tools/verify.ps1` 检查技能、模板、测试场景和示例输出


### 仓库内容

- `skills/`：四个可安装的 skill 入口
- `templates/`：精选 LaTeX 简历模板
- `examples/`：示例输入输出
- `tests/`：场景测试
- `docs/`：架构、贡献、发布和验证说明
- `tools/verify.ps1`：本地验证脚本


### 模板类型

| 模板 | 适用场景 |
| --- | --- |
| `templates/zh/standard` | 中文标准简历 |
| `templates/research/ats` | 面向学术申请的英文学术简历 |
| `templates/industry/ats` | 面向企业投递的求职英文简历 |
| `templates/industry/photo` | 用户明确要求需要包含头像照片的简历 |


### 它适合做什么

- 从聊天记录、项目说明、论文经历、实习经历中整理第一版简历
- 从 `.docx`、`.pdf`、截图或混合材料中提取信息并重写
- 生成可继续编辑、可本地编译的 LaTeX 简历
- 在本地 `xelatex` 可用时生成最终 PDF

### 不适合做什么

- 不凭空捏造实习、论文、奖项、指标或学校信息
- 不把聊天里的灵感当成事实，除非你确认它可以写进简历



### 与 `docx` / `pdf` companion skills 的关系

- `docx` 负责读取或提取 Word 简历材料
- `pdf` 负责读取、提取、检查 PDF 简历材料
- `resume-crafter` 负责简历 workflow：材料归一化、事实核查、写作、审阅、打包和交付
- 简单说：`docx` / `pdf` 帮 agent 读清楚文件，`resume-crafter` 负责把简历做完整



### 许可说明

本仓库的分发、复用与镜像以仓库内现有的 `LICENSE` 文件为准。

---

## English

`resume-crafter` is a four-skill package for producing factual 1-2 page resumes from chat notes, existing resumes, Word documents, PDFs, screenshots, and mixed source material.

The package is designed around source discipline: extract first, clarify blockers, draft only supported claims, review factual risk, and deliver a directly submittable `output/resume.pdf` plus corresponding output-local LaTeX source that can be recompiled outside the working directory.

### Installation

Tell your LLM agent:

```text
Fetch and follow instructions from:
https://raw.githubusercontent.com/Li-Baichuan-James/cv-skill/main/INSTALL.md
```

### Primary Entrypoint

Invoke `resume-crafter` for user-facing resume work.

Bundled supporting skills:

- `resume-intake-and-extraction`
- `resume-authoring-and-assembly`
- `resume-review-and-delivery`

### Quick Start

1. Install and validate the package through `INSTALL.md`:

```text
https://raw.githubusercontent.com/Li-Baichuan-James/cv-skill/main/INSTALL.md
```

2. Keep the full repository checkout available as the asset root and provide it as `CV_SKILL_ROOT`:

```text
CV_SKILL_ROOT=<absolute path to the full cv-skill checkout>
```

3. Ask naturally for the resume deliverable you want. For example:

```text
Build a 1-2 page ATS resume from the attached resume and my target backend software engineer notes.
```

You can also specify language, template family, source scope, or review constraints directly:

```text
Create a concise research resume from these academic materials. Keep only source-backed claims and ask before using uncertain metrics.
```

### Intended Use

- Create a new 1-2 page resume from chat-provided requirements and source material
- Convert an existing resume into LaTeX
- Rewrite an industry resume for ATS-oriented review
- Adapt academic or research material into a concise research resume
- Produce Chinese-language resumes using the standard Chinese template
- Package a directly submittable PDF and reproducible LaTeX source

### Scope Boundaries

This package does not produce long academic CVs. If the input is a long academic CV, the workflow should offer a concise 1-2 page research resume instead.

The workflow must not invent unsupported employers, degrees, publications, awards, dates, metrics, or tools. Ambiguous or missing facts should be clarified or omitted rather than guessed.

### Workflow Guarantees

- Extraction happens before drafting.
- Blockers stop the flow instead of being guessed around.
- Every final claim is resolved in `work/claim-source-map.md`.
- Each run uses a fresh workspace.
- Final delivery requires `output/resume.pdf`.
- Corresponding reproducible source is delivered through `output/resume.tex` and `output/common/resume.cls`.
- If XeLaTeX is missing, the workflow attempts to install or activate a XeLaTeX-capable environment; if PDF generation still cannot complete, final delivery is blocked.

### Expected Workspace

```text
resume-workspace-YYYYMMDD-HHMMSS/
  work/
    requirements-summary.md
    claim-source-map.md
    review.md
    common/
      resume.cls
  output/
    resume.tex
    resume.pdf
    common/
      resume.cls
```

Compile from the directory containing `resume.tex`:

```powershell
xelatex -interaction=nonstopmode -halt-on-error resume.tex
```

If `xelatex` is unavailable, the workflow attempts to install or activate a XeLaTeX-capable TeX distribution. If installation or compilation fails, the run reports a blocker instead of presenting source files alone as final delivery.

### Template Matrix

| Template | Intended use |
| --- | --- |
| `templates/industry/ats` | ATS-friendly industry resumes |
| `templates/industry/photo` | Industry resumes where a photo layout is explicitly appropriate |
| `templates/research/ats` | Concise research resumes adapted from academic material |
| `templates/zh/standard` | Chinese-language standard resume format |

### Dependencies And Companion Skills

- `resume-crafter` is the primary user-facing entrypoint.
- `resume-intake-and-extraction` normalizes chat, Word, PDF, screenshot, and mixed source material.
- `resume-authoring-and-assembly` drafts the 1-2 page LaTeX resume source.
- `resume-review-and-delivery` reviews factual safety and packages final outputs.
- Upstream `docx` is used when Word source material must be read or extracted.
- Upstream `pdf` is used when PDF source material must be read or inspected.
- Host image or OCR capability is required for screenshots or scanned sources.
- `xelatex` is required for final PDF delivery.

### Asset Root Contract

`CV_SKILL_ROOT` is the absolute path to the full repository checkout. Installed skill folders are runtime entrypoints only. Templates, examples, tests, docs, and verification tools remain under `CV_SKILL_ROOT`. If `CV_SKILL_ROOT` is unknown, the agent must ask for it before using repository assets.

### Verification

Run the repository verifier before publishing or after changing skills, templates, tests, examples, or installation docs:

```powershell
tools/verify.ps1
```

The verifier compiles template variants in temporary directories when `xelatex` is installed. Publishing a verified release requires running these compile checks in an environment with XeLaTeX.

### Repository Contents

- `skills/`: four installed skill entrypoints
- `templates/`: resume templates and shared LaTeX class assets
- `examples/`: example inputs and expected workflows
- `tests/`: skill and packaging test fixtures
- `docs/`: architecture, contribution, publishing, and verification docs
- `tools/verify.ps1`: repository verification helper

### License

Distribution, reuse, and mirroring of this repository are governed by the `LICENSE` file included in the repository.
