---
name: resume-authoring-and-assembly
description: Use when normalized resume material is ready and must be rewritten, organized, and assembled into a 1-2 page LaTeX resume without inventing facts.
---

# Resume Authoring And Assembly

## Overview

Turn normalized resume material into polished 1-2 page LaTeX while preserving factual meaning. Choose the right template, compress carefully, and keep uncertainty visible instead of hiding it behind fluent prose.

## Responsibilities

- Select `templates/industry/ats/`, `templates/industry/photo/`, `templates/research/ats/`, or `templates/zh/standard/`
- Rewrite bullets for clarity and professionalism
- Preserve factual meaning and source limits
- Decide section order and compression strategy
- Write the working LaTeX draft to `work/resume.tex`
- Copy `templates/common/resume.cls` into `work/common/resume.cls` before compiling or handing off for review
- Update `work/claim-source-map.md` after drafting so every final factual claim in `work/resume.tex` has a `resolved` entry

## Authoring Rules

- Do not begin drafting until `resume-intake-and-extraction` has finished and `work/extracted.md`, `work/requirements-summary.md`, and `work/claim-source-map.md` exist.
- Do not draft while any `missing-blocking` item remains.
- Do not invent achievements, metrics, dates, titles, venues, publication status, advisor names, or ownership details.
- If a detail is `needs-confirmation`, do not smooth it into final resume prose. Keep it out of the final bullet, or replace it with wording that stays strictly within `resolved` facts, and preserve the unresolved item in working notes.
- One page is preferred when readable; two pages are acceptable when compression would materially damage quality or target fit.
- Research resumes prioritize education, research, selected publications, selected projects, and scholarly traceability. Do not create a long academic CV.
- Industry resumes prioritize impact, delivery, stack clarity, and ATS readability.

## Template Assembly

- Use `\documentclass{common/resume}` in `work/resume.tex`.
- Ensure the workspace contains `work/common/resume.cls`; do not rely on relative paths back into the repository's `templates/` directory.
- Keep `output/resume.tex` reproducible from inside the generated workspace.

## Claim Map Closure

- Treat the intake claim map as a starting point, not a final artifact.
- After writing final bullets and sections, compare `work/resume.tex` against `work/claim-source-map.md`.
- Add or revise rows so every final contact line, role, employer, date, degree, publication, skill grouping, project description, and bullet claim maps to source material with `resolved` state.
- Keep `needs-confirmation` and `omitted-unresolved` rows only for working context or documented omissions; they must not appear in final prose.

## ATS And Photo Handling

- For ATS-sensitive industry resumes, default to a single-column, text-forward structure.
- Exclude photos from the primary ATS version unless the user explicitly confirms a non-ATS version after the tradeoff is explained.
- Do not present icon-heavy or multi-column layouts as ATS-safe.

## Boundaries

- Draft only inside the current workspace.
- Keep template selection within the bundled template families unless the user explicitly changes scope.
- Do not route wording, layout, or audience decisions through unrelated runtime skills.
