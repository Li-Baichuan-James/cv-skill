---
name: resume-intake-and-extraction
description: Use when resume source material arrives as chat requirements, a Word file, a PDF, screenshots, or mixed artifacts and must be normalized before any resume drafting begins.
---

# Resume Intake And Extraction

## Overview

Normalize messy resume input into traceable working material. Extract first, label confidence second, and stop before drafting when the source cannot safely support it.

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
- For every uncertain field, keep the raw source wording when available instead of normalizing it into a cleaner fact.

## Confidence Labels

Mark items as:

- `high-confidence`
- `low-confidence`
- `missing-blocking`

Use `[confirm]` markers for any item that still needs user confirmation before drafting or finalization.

## Stop Conditions

- If key chronology, identity, publication, title, or impact facts are missing, stop and ask targeted questions before drafting.
- If OCR or extraction damage makes facts unreliable, stop and report which fields are unsafe.
- If source artifacts conflict materially, ask for clarification before writing.
- Do not synthesize missing dates, names, venues, role scopes, or metrics from context.

## Workspace And Runtime Rules

- Write normalized materials only inside the current workspace, typically under `work/`.
- Do not write guessed or low-confidence resume content into `skills/`, `templates/`, or other repository paths.
- Do not activate unrelated runtime skills to resolve core resume facts.
