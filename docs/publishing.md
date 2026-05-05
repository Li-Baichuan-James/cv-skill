# Publishing

## Pre-Publish Checklist

- Four skills are present: `resume-crafter`, `resume-intake-and-extraction`, `resume-authoring-and-assembly`, and `resume-review-and-delivery`.
- Templates are present for `templates/industry/ats`, `templates/industry/photo`, `templates/research/ats`, and `templates/zh/standard`.
- `INSTALL.md` documents the `CV_SKILL_ROOT` asset-root contract.
- Documentation explains the intake, authoring, review, and delivery flow.
- Documentation states that final delivery requires `output/resume.pdf` plus corresponding LaTeX source.
- Tests include exact prompts and pass-fail criteria.
- A golden example is reproducible from repository examples.
- License text is present.
- No private resume material or binary assets are included.

## Release Gates

- Claim maps use the six-column schema: `Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling`.
- Template compilation is isolated and does not depend on files outside the workspace output directory.
- Output examples are reproducible from `output/resume.tex` and `output/common/resume.cls`.
- Verified releases are checked in an environment where `xelatex --version` works.

## Lightweight Release Procedure

1. Review `git diff` for scoped documentation, skill, template, and test changes.
2. Run `tools/verify.ps1`.
3. If PowerShell is unavailable, use `docs/verification.md` as the fallback checklist.
4. Check `xelatex --version`; a verified release requires PDF build capability.
5. Check skill frontmatter for all four bundled skills.
6. Confirm the 1-2 page resume scope and no long academic CV promise.
7. Scan for binary files and private resume material.
8. Tag the release after gates pass.

## Release Note Scope

Release notes should describe contract, template, verification, and workflow changes. Do not include private source material, generated personal resumes, or unsupported claims about environments that were not verified.
