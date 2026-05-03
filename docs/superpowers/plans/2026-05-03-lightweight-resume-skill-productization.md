# Lightweight Resume Skill Productization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reposition Resume Crafter as a lightweight 1-2 page mainstream resume package with stronger factual safety, clearer installation, and broader practical templates.

**Architecture:** Keep the four-skill flow and strengthen handoff contracts instead of adding a renderer or complex automation. Add a small shared LaTeX layer and four practical template variants inspired by billryan/resume while avoiding risky font and ATS defaults.

**Tech Stack:** Markdown skills/docs, LaTeX/XeLaTeX templates, Noto-style CJK font configuration guidance, git-tracked examples and pressure scenarios.

---

### Task 1: Tighten Skill Workflow Contracts

**Files:**
- Modify: `skills/resume-crafter/SKILL.md`
- Modify: `skills/resume-intake-and-extraction/SKILL.md`
- Modify: `skills/resume-authoring-and-assembly/SKILL.md`
- Modify: `skills/resume-review-and-delivery/SKILL.md`

- [ ] Update the package scope to 1-2 page mainstream resumes only.
- [ ] Add explicit uncertainty states: `resolved`, `needs-confirmation`, `omitted-unresolved`, `missing-blocking`.
- [ ] Require `work/claim-source-map.md` before authoring and review.
- [ ] Make `missing-blocking` stop authoring and finalization.
- [ ] Add review preconditions for upstream artifacts.

### Task 2: Improve Templates Without Heavy Rendering

**Files:**
- Create: `templates/common/resume.cls`
- Create: `templates/common/NotoSansSC_external.sty`
- Create: `templates/industry/ats/resume.tex`
- Create: `templates/industry/photo/resume.tex`
- Create: `templates/research/ats/resume.tex`
- Create: `templates/zh/standard/resume.tex`
- Modify: existing template examples as compatibility notes if needed.

- [ ] Add a small shared class with contact and dated-section macros.
- [ ] Add a Noto-based CJK style file, not Adobe fonts.
- [ ] Add ATS industry, photo industry, research, and Chinese standard templates.
- [ ] Keep templates as agent-editable LaTeX skeletons, not a full data renderer.

### Task 3: Productize Docs and Examples

**Files:**
- Modify: `README.md`
- Modify: `INSTALL.md`
- Modify: `docs/architecture.md`
- Modify: `docs/contributing.md`
- Modify: `docs/publishing.md`
- Modify: `examples/outputs/academic-example/README.md`
- Modify: `examples/outputs/industry-example/README.md`

- [ ] Add quickstart, template matrix, example prompt, output tree, and clear scope.
- [ ] Add copy-paste install and verification prompt.
- [ ] Replace long-CV language with 1-2 page research resume language.
- [ ] Make examples descriptive rather than placeholders.

### Task 4: Update Pressure Scenarios

**Files:**
- Modify: `tests/baseline-results.md`
- Create: `tests/scenarios/long-cv-out-of-scope.md`

- [ ] Add a scenario for long academic CV requests being narrowed or declined.
- [ ] Update baseline failure classes for the new state model and claim map.

### Task 5: Verify

**Files:**
- All changed files.

- [ ] Run git diff review.
- [ ] Check no Adobe font files or copyrighted assets were added.
- [ ] Check all skill frontmatter remains valid.
- [ ] Check docs consistently describe 1-2 page resumes and `xelatex`.
