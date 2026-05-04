---
name: resume-crafter
description: Use when creating, rewriting, or converting a source-backed 1-2 page resume from chat, documents, PDFs, images, or mixed artifacts.
---

# Resume Crafter

## Overview

Coordinate a four-skill workflow for mainstream 1-2 page resumes. Clarify blocking unknowns before drafting, keep every claim traceable to source material, and keep all generated artifacts inside one fresh workspace.

## When to Use

- User wants a new 1-2 page resume from requirements in chat.
- User wants an existing resume rewritten into a polished LaTeX resume.
- User provides `.docx`, `.pdf`, images, screenshots, or mixed source files for resume conversion.
- User wants both editable `.tex` and final `.pdf` outputs.
- User provides existing `.tex` plus `.pdf` and wants a cleaned or rebuilt resume.
- User asks for a long academic CV and needs scope narrowing to a concise research resume.

Do not produce cover letters, slide decks, portfolios, unrelated document work, or long academic CVs. If the user asks for a long CV, explain that this package targets 1-2 page resumes and ask whether to create a concise research resume instead.

## Asset Root

- Use `CV_SKILL_ROOT` as the absolute path to this skill package.
- Resolve `CV_SKILL_ROOT` in this order: first use an explicit user-provided `CV_SKILL_ROOT` if present; otherwise use the known repository/package checkout location if the runtime exposes the loaded skill path or the skills are still installed under the repo; if neither is available, ask the user for the absolute asset root before using bundled templates.
- Read bundled templates, examples, tests, and docs from `CV_SKILL_ROOT`.
- Do not guess repository-relative paths such as `templates/...` from the current working directory.

## Workflow

1. Create a fresh workspace named `resume-workspace-YYYYMMDD-HHMMSS` unless the user provides another folder.
2. Never reuse a non-empty workspace without explicit user confirmation.
3. Create `input/`, `work/`, and `output/` inside the workspace.
4. Copy or place all source artifacts under `input/` and keep notes, extraction, and drafts under `work/`.
5. Identify whether the target is industry, research-oriented, Chinese standard, or photo/visual.
6. Invoke `resume-intake-and-extraction` before any drafting.
7. Ask only targeted questions needed to resolve `missing-blocking` or high-risk uncertainty.
8. After answers arrive, update `work/extracted.md`, `work/requirements-summary.md`, and `work/claim-source-map.md` with the user confirmations.
9. Invoke `resume-authoring-and-assembly` only after all `missing-blocking` items are resolved or audited as omitted with explicit approval.
10. Invoke `resume-review-and-delivery` to review, build, and package the outputs.

## Required Working Files

- `work/extracted.md`: normalized source material
- `work/requirements-summary.md`: target, template choice, gaps, omissions, and user confirmations
- `work/claim-source-map.md`: every resume claim mapped to source material and confidence state
- `work/resume.tex`: draft LaTeX source

## Claim Map Schema

Use this six-column header in `work/claim-source-map.md`:

| Claim | Source | Evidence detail | State | Final handling | Notes |
|---|---|---|---|---|---|

## Uncertainty States

- `resolved`: confirmed and safe to use
- `needs-confirmation`: non-blocking, visible in working notes, not final prose unless confirmed
- `omitted-unresolved`: unresolved and intentionally left out of final prose
- `missing-blocking`: blocks drafting or finalization

Final output eligibility:

- `resolved`: may appear in final resume prose.
- `needs-confirmation`: may appear only in working notes, never in final prose.
- `omitted-unresolved`: records an intentional omission and must not appear in final prose.
- `missing-blocking`: blocks authoring and finalization until resolved or audited as omitted with explicit user approval.

## Omission Audit

Record every intentionally omitted blocking item in `work/requirements-summary.md` with:

- omitted field or claim
- reason for omission
- explicit user approval
- impact on final wording

## Guardrails

- Intake decides what is known, unknown, or unsafe.
- Authoring may draft only from `resolved` facts or conservative wording supported by `resolved` claim-map entries.
- Do not generalize, upgrade, or reframe facts unless broader wording is source-backed or user-confirmed.
- Review-and-delivery may finalize only when every final factual claim maps to a `resolved` entry, `missing-blocking` items are resolved or audited with clear approval, `[confirm]` markers are cleared, the omission audit is complete, and the build is clean or explicitly unavailable.
- For ATS-sensitive industry use, default away from photos, multi-column layouts, and icon-heavy contact blocks unless the user explicitly accepts the tradeoff after it is explained.
- Keep all generated content inside the current run's workspace. Do not write resume output into `skills/`, `templates/`, `docs/`, `examples/`, or repo root paths.

## Runtime Boundaries

- During end-user resume generation, use only these bundled skills: `resume-crafter`, `resume-intake-and-extraction`, `resume-authoring-and-assembly`, and `resume-review-and-delivery`.
- Use upstream `docx` only when `.docx` input requires it.
- Use upstream `pdf` only when `.pdf` input requires it.
- For image or screenshot input, use the host platform's built-in image reading or OCR path when available. Do not add unrelated OCR or document-generation skills just to handle images.
- Do not route core resume decisions through unrelated runtime skills.

## Output Contract

- Final deliverables: `output/resume.tex`, `output/common/resume.cls`, and `output/resume.pdf` when PDF tooling is available.
- If PDF tooling is unavailable, deliver `output/resume.tex` and `output/common/resume.cls`, report the unavailable build tooling, and do not claim `output/resume.pdf` was produced.
- Both `work/resume.tex` and `output/resume.tex` use `\documentclass{common/resume}`.
- Working files stay under the generated workspace folder.
- Preserve `work/review.md` and `work/build.log` when review or build runs.
- If factual risk remains unresolved, return a review/blocker state instead of presenting the resume as final.
