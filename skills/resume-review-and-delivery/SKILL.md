---
name: resume-review-and-delivery
description: Use when a LaTeX resume draft exists and needs factual review, ATS or research-resume risk checks, build validation, packaging, and final delivery.
---

# Resume Review And Delivery

## Overview

Review the draft for factual safety and presentation risk, compile the PDF, and package the final outputs without overstating confidence.

## Preconditions

Before review, require these files in the current workspace:

- `work/extracted.md`
- `work/requirements-summary.md`
- `work/claim-source-map.md`
- `work/resume.tex`

If any are missing, return a blocker instead of finalizing.

## Review Checklist

- every factual claim is supported by source material or clearly marked for confirmation
- no `[confirm]` markers remain in a version presented as final
- no `\placeholder{...}` tokens or stock template bullets remain in a version presented as final
- no `missing-blocking` claims remain in `work/claim-source-map.md`
- wording is professional and internally consistent
- ATS, photo, language, and layout risks are called out when relevant
- page count fits the target context
- links and contact information appear intentional

## Build Requirements

- Compile `work/resume.tex` with XeLaTeX into `output/resume.pdf`
- Copy final source into `output/resume.tex`
- Preserve review notes and build logs under `work/`
- Keep all outputs inside the current workspace folder

## Failure Handling

- Fix and rebuild only when the issue is a local LaTeX assembly problem inside the current draft, such as escaping, missing braces, package use already implied by the template, or other source-level mistakes that can be corrected without guessing new resume facts or changing scope.
- Stop and report a blocker when the build failure depends on missing user facts, ambiguous content decisions, missing external assets, unavailable tooling, or template changes outside the current resume draft.
- If factual uncertainty remains, return a review state instead of claiming the resume is final.
- If the draft contains ATS-risk choices such as a photo or multi-column layout, state that explicitly and confirm that the delivered version matches the user's accepted tradeoff.

## Runtime Rule

- Do not bring in unrelated runtime skills during review, packaging, or delivery.
