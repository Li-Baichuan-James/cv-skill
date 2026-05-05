# Contributing

## Expectations

- Preserve factual safety over fluent rewriting.
- Preserve the stop threshold for missing, contradictory, unverifiable, or vague claims.
- Preserve the claim map backbone and six-column schema: `Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling`.
- Ensure final prose resolves every included claim and does not contain unsupported facts.
- Maintain an omission audit for excluded, weak, or blocked claims.
- Preserve runtime discipline: resume content uses only the four bundled skills plus `docx` and `pdf` as input adapters when needed.
- Treat `docx` and `pdf` as adapters, not authoring or review substitutes.
- Preserve template intent for industry ATS, industry photo, research ATS, and Chinese standard resumes.
- Keep workspace isolation with fresh `resume-workspace-YYYYMMDD-HHMMSS` directories.
- Preserve output-local reproducibility with both `work/common/resume.cls` and `output/common/resume.cls`.
- Preserve the hard final-delivery requirement for `output/resume.pdf`; source files alone are not a final resume delivery.
- Do not commit binary assets or private resume material.

## Review Focus

Before release, reviewers should verify that the delivery contract still produces:

- `output/resume.tex`
- `output/common/resume.cls`
- `output/resume.pdf`

Reviewers should run `tools/verify.ps1` or follow `docs/verification.md` before release. Pay particular attention to claim-map completeness, blocker behavior, `CV_SKILL_ROOT` asset-root handling, and output-local template compilation.
