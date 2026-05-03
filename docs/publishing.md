# Publishing

## Pre-Publish Checklist

- verify all four bundled skill folders are present
- verify the four supported template variants are complete: industry ATS, industry photo, research ATS, and Chinese standard
- verify `INSTALL.md` still matches the shipped repository layout
- verify `docs/` reflects the current runtime flow and guardrails
- verify `tests/` still cover the intended scenarios
- verify `LICENSE` contains the intended MIT License text before publishing
- verify no copyrighted fonts, photos, source resumes, or private user data are included
- verify no accidental font, image, PDF, or source-resume assets are included unless license and privacy review is documented

## Release Gates

- `LICENSE` contains the complete approved license text
- install guidance still matches the supported agent environments
- runtime boundary and uncertainty-threshold docs still match shipped skill behavior
- templates compile with XeLaTeX when local fonts and tooling are present
- templates compile from isolated workspaces containing `resume.tex` and `common/resume.cls`

## Lightweight Release Procedure

1. Review `git diff` for accidental private data or generated resume artifacts.
2. Run `xelatex --version` and note whether local PDF build verification is available.
3. Check each `skills/*/SKILL.md` frontmatter has `name` and `description`.
4. Confirm README, INSTALL, architecture, and tests all describe 1-2 page scope.
5. Scan the repository for accidental binary assets: `*.otf`, `*.ttf`, `*.woff`, `*.jpg`, `*.jpeg`, `*.png`, and `*.pdf`.
6. Tag releases as `vMAJOR.MINOR.PATCH` and summarize skill, template, dependency, and safety-rule changes.

## Release Note Scope

Call out changes to:

- skill triggers or runtime boundaries
- factual safety rules or stop conditions
- template behavior or output contract
- required dependencies such as `pandoc`, `xelatex`, `docx`, or `pdf`
- licensing or distribution terms
- installation, verification, or publishing instructions
