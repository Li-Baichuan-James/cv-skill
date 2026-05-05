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

## Quality-Critical Unknowns

Treat an uncertain fact as quality-critical when it affects identity/display name, localized name, target role/headline, required or user-visible contact-block choices, required photos, required language/style, user-explicit deliverable requirements, or any content whose omission would make the resume visibly worse or mismatched.

Quality-critical unknowns must be marked `missing-blocking`, not `needs-confirmation`, until the user confirms them or explicitly approves omission. Do not downgrade them merely to keep drafting moving.

Record the exact targeted question that should be asked in `work/requirements-summary.md`. Use a brainstorming-style question: clarify the purpose or constraint, ask one question at a time when it affects the next decision, and offer concise options when helpful.

## Claim Map Format

Use this six-column table in `work/claim-source-map.md`:

| Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling |
|---|---|---|---|---|---|
| Candidate held role X at Y | `input/source.pdf` | p.1, experience section | "Role X, Y" | resolved | use |
| Led deployment for Z users | `input/screenshot-01.png` | visible project card, metric partly cropped | visible wording unclear; ask user to confirm Z | needs-confirmation | ask or keep out of final prose with working-note trace |
| Chinese display name for a Chinese resume is unknown | `input/source.tex` | header/name line | source only says `LI Baichuan`; ask user how to display name in Chinese resume | missing-blocking | ask before drafting |

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

## Follow-Up Confirmation Update Mode

When the user answers clarification questions after intake:

- update `work/extracted.md` with the confirmation wording and date/context of the answer
- cite the answer as `user confirmation` in `work/claim-source-map.md`
- change confirmed rows from `missing-blocking` or `needs-confirmation` to `resolved` only when the answer directly supports the final claim
- keep unresolved non-blocking uncertainty as `needs-confirmation`; keep unresolved quality-critical or blocking uncertainty as `missing-blocking` unless the user explicitly approves omission; do not silently delete unresolved rows
- update `work/requirements-summary.md` so resolved blockers, remaining blockers, and omission audits stay current

## Legacy Confidence Labels

If helpful, also label extraction snippets as commentary only:

- `high-confidence`
- `low-confidence`
- `missing-blocking`

Legacy `high-confidence` and `low-confidence` commentary never controls final output eligibility. The Confidence States above are authoritative.

## Stop Conditions

- If key chronology, identity, publication, title, or impact facts are missing, stop and ask targeted questions before drafting.
- If a quality-critical unknown exists, stop and ask a targeted question before drafting.
- Do not resolve quality-critical uncertainty by guessing, silently deleting the field, or converting it to a non-blocking note.
- If OCR or extraction damage makes facts unreliable, stop and report which fields are unsafe.
- If source artifacts conflict materially, ask for clarification before writing.
- Do not synthesize missing dates, names, venues, role scopes, or metrics from context.
- If the user requests a long academic CV, stop and ask whether to create a concise 1-2 page research resume.

## Workspace And Runtime Rules

- Write normalized materials only inside the current workspace, typically under `work/`.
- Do not write guessed or low-confidence resume content into `skills/`, `templates/`, or other repository paths.
- Do not activate unrelated runtime skills to resolve core resume facts.
