---
name: resume-crafter
description: Use when a user wants a resume or CV-related document created, rewritten, or converted from chat requirements, documents, PDFs, images, or mixed source material, including long CV requests that must be narrowed to an in-scope 1-2 page resume.
---

# Resume Crafter

## Overview

Coordinate a four-skill workflow for mainstream 1-2 page resumes. Clarify blocking unknowns before drafting, keep every claim traceable to source material, and keep all generated artifacts inside one fresh workspace.

## When to Use

- User wants a new 1-2 page resume from requirements in chat.
- User wants an existing resume rewritten into a polished LaTeX resume.
- User provides `.docx`, `.pdf`, images, screenshots, or mixed source files for resume conversion.
- User wants both editable `.tex` and final `.pdf` outputs.
- User asks for a long academic CV and needs scope narrowing to a concise research resume.

Do not produce cover letters, slide decks, portfolios, unrelated document work, or long academic CVs. If the user asks for a long CV, explain that this package targets 1-2 page resumes and ask whether to create a concise research resume instead.

## Workflow

1. Create a new folder in the current working directory with `input/`, `work/`, and `output/`.
2. Copy or place source artifacts under `input/` and keep notes, extraction, and drafts under `work/`.
3. Identify whether the target is industry, research-oriented, Chinese standard, or photo/visual.
4. Invoke `resume-intake-and-extraction` before any drafting.
5. Ask only the questions needed to resolve `missing-blocking` or high-risk uncertainty.
6. Invoke `resume-authoring-and-assembly` only after all `missing-blocking` items are resolved. Non-blocking uncertainty may proceed only as `needs-confirmation` or `omitted-unresolved` in working notes.
7. Invoke `resume-review-and-delivery` to review, build, and package the outputs.

## Required Working Files

- `work/extracted.md`: normalized source material
- `work/requirements-summary.md`: target, template choice, gaps, and user confirmations
- `work/claim-source-map.md`: every resume claim mapped to source material and confidence state
- `work/resume.tex`: draft LaTeX source

## Uncertainty States

- `resolved`: confirmed and safe to use
- `needs-confirmation`: non-blocking, visible in working notes, not final prose unless confirmed
- `omitted-unresolved`: unresolved and intentionally left out of final prose
- `missing-blocking`: blocks drafting or finalization

Final output eligibility:

- `resolved`: may appear in final resume prose.
- `needs-confirmation`: may appear only in working notes, never in final prose.
- `omitted-unresolved`: records an intentional omission and must not appear in final prose.
- `missing-blocking`: blocks authoring and finalization until resolved or explicitly omitted.

## Guardrails

- Intake decides what is known, unknown, or unsafe.
- Authoring may draft only from `resolved` facts or conservative wording supported by `resolved` claim-map entries.
- Review-and-delivery may finalize only when every final factual claim maps to a `resolved` entry, `missing-blocking` and final-prose `[confirm]` markers are cleared, and the build is clean.
- For ATS-sensitive industry use, default away from photos, multi-column layouts, and icon-heavy contact blocks unless the user explicitly accepts the tradeoff after it is explained.
- Keep all generated content inside the current run's workspace. Do not write resume output into `skills/`, `templates/`, `docs/`, `examples/`, or repo root paths.

## Runtime Boundaries

- During end-user resume generation, use only these bundled skills: `resume-crafter`, `resume-intake-and-extraction`, `resume-authoring-and-assembly`, and `resume-review-and-delivery`.
- Use upstream `docx` only when `.docx` input requires it.
- Use upstream `pdf` only when `.pdf` input requires it.
- For image or screenshot input, use the host platform's built-in image reading or OCR path when available. Do not add unrelated OCR or document-generation skills just to handle images.
- Do not route core resume decisions through unrelated runtime skills.

## Output Contract

- Final deliverables: `output/resume.tex` and `output/resume.pdf`
- Working files stay under the generated workspace folder.
- Preserve `work/review.md` and `work/build.log` when review or build runs.
- If factual risk remains unresolved, return a review/blocker state instead of presenting the resume as final.
