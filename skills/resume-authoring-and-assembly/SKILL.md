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

## Authoring Rules

- Do not begin drafting until `resume-intake-and-extraction` has finished and `work/extracted.md`, `work/requirements-summary.md`, and `work/claim-source-map.md` exist.
- Do not draft while any `missing-blocking` item remains.
- Do not invent achievements, metrics, dates, titles, venues, publication status, advisor names, or ownership details.
- If a detail is `needs-confirmation`, do not smooth it into final resume prose. Keep it out of the final bullet, or replace it with wording that stays strictly within `resolved` facts, and preserve the unresolved item in working notes.
- One page is preferred when readable; two pages are acceptable when compression would materially damage quality or target fit.
- Research resumes prioritize education, research, selected publications, selected projects, and scholarly traceability. Do not create a long academic CV.
- Industry resumes prioritize impact, delivery, stack clarity, and ATS readability.

## ATS And Photo Handling

- For ATS-sensitive industry resumes, default to a single-column, text-forward structure.
- Exclude photos from the primary ATS version unless the user explicitly confirms a non-ATS version after the tradeoff is explained.
- Do not present icon-heavy or multi-column layouts as ATS-safe.

## Boundaries

- Draft only inside the current workspace.
- Keep template selection within the bundled template families unless the user explicitly changes scope.
- Do not route wording, layout, or audience decisions through unrelated runtime skills.
