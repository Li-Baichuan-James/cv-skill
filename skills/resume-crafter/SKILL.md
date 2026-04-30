---
name: resume-crafter
description: Use when a user wants a resume or CV created, rewritten, or converted into a polished LaTeX and PDF package from chat requirements, documents, PDFs, images, or mixed source material.
---

# Resume Crafter

## Overview

Coordinate a four-skill resume workflow. Clarify blocking unknowns before drafting, keep every claim traceable to source material, and keep all generated artifacts inside one fresh workspace.

## When to Use

- User wants a new resume or CV from requirements in chat.
- User wants an existing resume rewritten into a polished LaTeX resume.
- User provides `.docx`, `.pdf`, images, screenshots, or mixed source files.
- User wants both editable `.tex` and final `.pdf` outputs.

Do not use for cover letters, slide decks, portfolios, or unrelated document work.

## Workflow

1. Create a new folder in the current working directory with `input/`, `work/`, and `output/`.
2. Copy or place source artifacts under `input/` and keep notes, extraction, and drafts under `work/`.
3. Identify whether the target is academic, industry, or mixed.
4. Invoke `resume-intake-and-extraction` before any drafting.
5. Ask only the questions needed to resolve blocking or high-risk uncertainty.
6. Invoke `resume-authoring-and-assembly` only after the unknowns are either resolved or explicitly marked.
7. Invoke `resume-review-and-delivery` to review, build, and package the outputs.

## Guardrails

- Intake decides what is known, unknown, or unsafe.
- Authoring may draft only from confirmed or conservatively labeled material.
- Review-and-delivery may finalize only when unresolved markers are cleared and the build is clean.
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
- Working files stay under the generated workspace folder
- If factual risk remains unresolved, do not present the resume as final
