---
name: resume-authoring-and-assembly
description: Use when normalized resume material is ready and must be rewritten, organized, and assembled into an academic or industry LaTeX resume without inventing facts.
---

# Resume Authoring And Assembly

## Overview

Turn normalized resume material into polished LaTeX while preserving factual meaning. Choose the right template, compress carefully, and keep uncertainty visible instead of hiding it behind fluent prose.

## Responsibilities

- Select `templates/academic/` or `templates/industry/`
- Rewrite bullets for clarity and professionalism
- Preserve factual meaning and source limits
- Decide section order and compression strategy
- Write the working LaTeX draft to `work/resume.tex`

## Authoring Rules

- Do not begin drafting until `resume-intake-and-extraction` has finished and blocking unknowns are either resolved or explicitly marked.
- Do not invent achievements, metrics, dates, titles, venues, publication status, advisor names, or ownership details.
- If a detail is uncertain but non-blocking, do not smooth it into final resume prose. Keep it out of the final bullet, or replace it with wording that stays strictly within confirmed facts, and preserve the unresolved item as `[confirm]` in working notes.
- One page is preferred when readable; expand only when compression would materially damage quality or target fit.
- Academic resumes prioritize education, research, publications, teaching, and scholarly traceability.
- Industry resumes prioritize impact, delivery, stack clarity, and ATS readability.

## ATS And Photo Handling

- For ATS-sensitive industry resumes, default to a single-column, text-forward structure.
- Exclude photos from the primary ATS version unless the user explicitly confirms a non-ATS version after the tradeoff is explained.
- Do not present icon-heavy or multi-column layouts as ATS-safe.

## Boundaries

- Draft only inside the current workspace.
- Keep template selection within the bundled `academic` and `industry` families unless the user explicitly changes scope.
- Do not route wording, layout, or audience decisions through unrelated runtime skills.
