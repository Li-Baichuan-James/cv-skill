---
name: resume-authoring-and-assembly
description: Use when normalized resume material is ready and must be rewritten, organized, and assembled into a 1-2 page LaTeX resume without inventing facts.
---

# Resume Authoring And Assembly

## Overview

Turn normalized resume material into polished 1-2 page LaTeX while preserving factual meaning. Choose the right template, compress carefully, and keep uncertainty visible instead of hiding it behind fluent prose.

## Responsibilities

- Select templates under `CV_SKILL_ROOT`, such as `templates/industry/ats/`, `templates/industry/photo/`, `templates/research/ats/`, or `templates/zh/standard/`
- Rewrite bullets for clarity and professionalism
- Preserve factual meaning and source limits
- Decide section order and compression strategy
- Write the working LaTeX draft to `work/resume.tex`
- Copy `CV_SKILL_ROOT/templates/common/resume.cls` into `work/common/resume.cls` before compiling or handing off for review
- Preserve output-local packaging requirements for `resume-review-and-delivery`
- Update `work/claim-source-map.md` after drafting so every final factual claim in `work/resume.tex` has a `resolved` entry

## Asset Root

- Use `CV_SKILL_ROOT` as the absolute path to this skill package.
- Resolve `CV_SKILL_ROOT` in this order: first use an explicit user-provided `CV_SKILL_ROOT` if present; otherwise use the known repository/package checkout location if the runtime exposes the loaded skill path or the skills are still installed under the repo; if neither is available, ask the user for the absolute asset root before using bundled templates.
- Read bundled templates, examples, tests, and docs from `CV_SKILL_ROOT`.
- Do not guess repository-relative template paths from the current working directory.

## Authoring Rules

- Do not begin drafting until `resume-intake-and-extraction` has finished and `work/extracted.md`, `work/requirements-summary.md`, and `work/claim-source-map.md` exist.
- Before drafting, confirm `work/claim-source-map.md` uses the exact six-column schema and `work/requirements-summary.md` records target audience, selected template family, gaps, omissions, and user confirmations.
- Do not draft while any `missing-blocking` item remains unresolved or unaudited as omitted with explicit user approval.
- Do not draft unless every omitted blocking item has an omission audit with reason, explicit user approval, and impact on final wording.
- Do not invent achievements, metrics, dates, titles, venues, publication status, advisor names, or ownership details.
- Do not generalize, upgrade, or reframe facts unless broader wording is source-backed or user-confirmed.
- If a quality-critical unknown remains unresolved, stop and return to intake for a targeted user question; do not draft around it.
- If a non-critical detail is `needs-confirmation`, do not smooth it into final resume prose. Keep it out of the final bullet, or replace it with wording that stays strictly within `resolved` facts, and preserve the unresolved item in working notes.
- Do not resolve quality-critical uncertainty by silently deleting the affected field. Omission is allowed only after explicit user approval recorded in the omission audit.
- One page is preferred when readable; two pages are acceptable when compression would materially damage quality or target fit.
- Research resumes prioritize education, research, selected publications, selected projects, and scholarly traceability. Do not create a long academic CV.
- Industry resumes prioritize impact, delivery, stack clarity, and ATS readability.

## Quality-Critical Examples

- Chinese resume requested, source has only a romanized English name, and no confirmed Chinese display name: return to intake and ask how the name should appear.
- Job resume requested, source spans AI, mobile, and research work, and target role/headline is unknown: ask for the target role or offer concise options before drafting a headline.
- Phone number missing, email and website are present, and the user did not request phone contact: omit phone with audit; do not block drafting.

## Template Assembly

- Use `\documentclass{common/resume}` in `work/resume.tex`.
- Ensure the workspace contains `work/common/resume.cls`; do not rely on relative paths back into the repository's `templates/` directory.
- Authoring produces `work/resume.tex` and `work/common/resume.cls`; it does not finalize `output/`.
- Review-and-delivery copies final source and class into `output/` after review and build readiness.
- Working draft build command from `work/`: `xelatex -interaction=nonstopmode -halt-on-error resume.tex`
- Output-local build command after review packaging from `output/`: `xelatex -interaction=nonstopmode -halt-on-error resume.tex`

## Claim Map Closure

- Treat the intake claim map as a starting point, not a final artifact.
- After writing final bullets and sections, compare `work/resume.tex` against `work/claim-source-map.md`.
- Add or revise rows so every final contact line, summary/profile sentence claim, role, employer, date, degree, publication, skill grouping, project description, and bullet claim maps to source material with `resolved` state.
- Every `resolved` row added or revised during authoring must include a non-empty source artifact, source locator, and raw wording or user confirmation.
- Include a summary sentence stating that every final factual claim is covered by a `resolved` row.
- Keep `needs-confirmation` and `omitted-unresolved` rows only for working context or documented omissions; they must not appear in final prose.

## ATS And Photo Handling

- For ATS-sensitive industry resumes, default to a single-column, text-forward structure.
- Exclude photos from the primary ATS version unless the user explicitly confirms a non-ATS version after the tradeoff is explained.
- Do not present icon-heavy or multi-column layouts as ATS-safe.

## Boundaries

- Draft only inside the current workspace.
- Keep template selection within the bundled template families unless the user explicitly changes scope.
- Do not route wording, layout, or audience decisions through unrelated runtime skills.
