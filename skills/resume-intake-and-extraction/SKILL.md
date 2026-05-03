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

## Required Behavior

- Use upstream `docx` for `.docx` inputs.
- Use upstream `pdf` for `.pdf` inputs.
- Prefer platform-native image reading or OCR for image inputs.
- Save extracted content to `work/extracted.md`.
- Save gaps, conflicts, and follow-up questions to `work/requirements-summary.md`.
- Save claim traceability to `work/claim-source-map.md`.
- For every uncertain field, keep the raw source wording when available instead of normalizing it into a cleaner fact.

## Confidence Labels

Mark each usable or requested fact as:

- `resolved`
- `needs-confirmation`
- `omitted-unresolved`
- `missing-blocking`

Legacy confidence labels may appear inside notes, but the state above controls whether drafting can proceed.

Use `[confirm]` only for `needs-confirmation` items in working notes. Do not use `[confirm]` to bypass `missing-blocking`.

## Claim Map Format

Use this compact table in `work/claim-source-map.md`:

| Claim | Source | State | Final handling |
|---|---|---|---|
| Candidate held role X at Y | input/source.pdf p.1 or chat quote | resolved | use |
| Exact metric unclear | OCR line or user note | needs-confirmation | omit or ask |

## Legacy Confidence Labels

If helpful, also label extraction snippets as:

- `high-confidence`
- `low-confidence`
- `missing-blocking`

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
