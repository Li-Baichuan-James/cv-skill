# Architecture

## Four-Skill Layout

- `resume-crafter`: entrypoint, workspace creation, and runtime boundaries
- `resume-intake-and-extraction`: source extraction, confidence labeling, and stop conditions
- `resume-authoring-and-assembly`: template choice, rewriting, and LaTeX draft assembly for 1-2 page resumes
- `resume-review-and-delivery`: factual review, risk checks, compilation, and packaging

## Runtime Flow

1. `resume-crafter` creates a fresh workspace and selects the resume path.
2. `resume-intake-and-extraction` normalizes chat, `.docx`, `.pdf`, or image input into traceable working notes and `work/claim-source-map.md`.
3. If `missing-blocking` facts are missing or unsafe, the flow stops for targeted clarification; otherwise uncertainty is classified as `needs-confirmation` or `omitted-unresolved`.
4. `resume-authoring-and-assembly` chooses industry ATS, industry photo, research ATS, or Chinese standard template and writes the working LaTeX draft.
5. `resume-review-and-delivery` checks factual safety, ATS or academic presentation risk, and build readiness.
6. Final artifacts are delivered as `output/resume.tex` and `output/resume.pdf`.

## Uncertainty Thresholds

- blocking facts: stop when identity, employer or institution, role title, date range, chronology, publication venue or status, degree status, or claimed impact metrics are missing, conflicting, or too damaged to trust
- unsafe facts: stop when OCR, conflicting sources, or ambiguous wording would turn a guess into a concrete claim
- traceable uncertainty: proceed only when the detail is non-blocking, the source wording can be preserved in working notes, and the final resume can omit or conservatively reword the detail without inventing facts

## Scope

Resume Crafter targets mainstream 1-2 page resumes: industry, research-oriented, Chinese standard, and explicitly approved photo/visual variants. Long academic CVs are out of scope and should be narrowed to concise research resumes.

## Runtime Boundary

Resume-content decisions belong to the four bundled skills and, when needed, upstream `docx` or `pdf`. Platform-injected process skills may exist, but they are outside the resume decision path.

## Design Intent

The package favors disciplined handoffs over free-form generation: extract first, map claims to sources, draft only from supported facts, and finalize only after review and a clean local XeLaTeX build.
