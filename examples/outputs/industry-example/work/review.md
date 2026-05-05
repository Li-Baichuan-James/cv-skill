# Review Notes

## Factual Review

- Every final factual claim in `output/resume.tex` maps to a `resolved` row in `work/claim-source-map.md`.
- No `missing-blocking` facts remain.
- No `[confirm]` markers remain.
- No unresolved or omitted facts appear in final prose.

## ATS Review

- Primary version uses the industry ATS template.
- No photo, icon-heavy contact block, or multi-column layout is used.
- Contact details are text-forward.

## Build Review

- `output/resume.tex` uses `\documentclass{common/resume}`.
- `output/common/resume.cls` is included for output-local reproducibility.
- Runtime final delivery requires `output/resume.pdf`; checked examples omit generated PDFs from the repository.
