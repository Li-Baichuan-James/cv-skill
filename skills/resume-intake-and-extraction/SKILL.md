---
name: resume-intake-and-extraction
description: Use when resume source material arrives as chat requirements, a Word file, a PDF, screenshots, or mixed artifacts and must be normalized before any 1-2 page resume drafting begins.
---

# Resume Intake And Extraction

## Overview

Normalize messy resume input into traceable working material. Extract first, map claims second, and stop before drafting when the source cannot safely support a concise 1-2 page resume.

## Inputs

- Chat requirements
- `.docx`
- `.pdf`
- Images or screenshots
- Mixed bundles

## Preconditions

- Use within a `resume-crafter` workspace that already has `input/` and `work/` directories.
- If no current workspace with `input/` and `work/` exists, invoke or resume `resume-crafter`, or return a blocker asking for a workspace before writing files.

## Required Behavior

- Use upstream `docx` for `.docx` inputs.
- Use upstream `pdf` for `.pdf` inputs.
- Prefer platform-native image reading or OCR for image inputs.
- Save extracted content to `work/extracted.md`.
- Save gaps, conflicts, omissions, and user confirmations to `work/requirements-summary.md`.
- Save initial claim traceability to `work/claim-source-map.md`; authoring must later update this map to cover the final rendered resume claims.
- For every uncertain field, keep the raw source wording when available instead of normalizing it into a cleaner fact.

## Confidence States

Mark each usable or requested fact as:

- `resolved`
- `needs-confirmation`
- `omitted-unresolved`
- `missing-blocking`

Legacy confidence labels may appear inside notes, but the state above controls whether drafting can proceed.

Use `[confirm]` only for `needs-confirmation` items in working notes. Do not use `[confirm]` to bypass `missing-blocking`, and do not allow `[confirm]` or `needs-confirmation` claims in final resume prose.

Final output eligibility:

- `resolved`: may appear in final resume prose.
- `needs-confirmation`: may appear only in working notes, never in final prose.
- `omitted-unresolved`: records an intentional omission and must not appear in final prose.
- `missing-blocking`: blocks authoring and finalization until resolved or audited as omitted with explicit user approval.

## Claim Map Format

Use this six-column table in `work/claim-source-map.md`:

| Claim | Source | Evidence detail | State | Final handling | Notes |
|---|---|---|---|---|---|
| Candidate held role X at Y | `input/source.pdf` | p.1, experience section | resolved | use | PDF text extraction clear |
| Led deployment for Z users | `input/screenshot-01.png` | visible project card, metric partly cropped | needs-confirmation | ask or omit | screenshot uncertainty |

This intake map covers source facts and uncertainties. After the final resume prose is drafted, `resume-authoring-and-assembly` must update the table so every final factual claim has a `resolved` row.

## Evidence Requirements

- PDFs: include page numbers.
- Images and screenshots: include filenames and visible regions.
- Chat: quote the user's wording or cite the user confirmation.
- Follow-up answers: record as user confirmation.

## Omission Audit

For every intentionally omitted blocking item, record in `work/requirements-summary.md`:

- omitted field or claim
- reason for omission
- explicit user approval
- impact on final wording

## Legacy Confidence Labels

If helpful, also label extraction snippets as commentary only:

- `high-confidence`
- `low-confidence`
- `missing-blocking`

Legacy `high-confidence` and `low-confidence` commentary never controls final output eligibility. The Confidence States above are authoritative.

## Stop Conditions

- If key chronology, identity, publication, title, or impact facts are missing, stop and ask targeted questions before drafting.
- If OCR or extraction damage makes facts unreliable, stop and report which fields are unsafe.
- If source artifacts conflict materially, ask for clarification before writing.
- Do not synthesize missing dates, names, venues, role scopes, or metrics from context.
- If the user requests a long academic CV, stop and ask whether to create a concise 1-2 page research resume.

## Workspace And Runtime Rules

- Write normalized materials only inside the current workspace, typically under `work/`.
- Do not write guessed or low-confidence resume content into `skills/`, `templates/`, or other repository paths.
- Do not activate unrelated runtime skills to resolve core resume facts.
