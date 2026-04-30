# Publishing

## Pre-Publish Checklist

- verify all four bundled skill folders are present
- verify `templates/academic/` and `templates/industry/` are complete
- verify `INSTALL.md` still matches the shipped repository layout
- verify `docs/` reflects the current runtime flow and guardrails
- verify `tests/` still cover the intended scenarios
- verify `LICENSE` contains the intended MIT License text before publishing

## Release Gates

- `LICENSE` contains the complete approved license text
- install guidance still matches the supported agent environments
- runtime boundary and uncertainty-threshold docs still match shipped skill behavior

## Release Note Scope

Call out changes to:

- skill triggers or runtime boundaries
- factual safety rules or stop conditions
- template behavior or output contract
- required dependencies such as `pandoc`, `xelatex`, `docx`, or `pdf`
- licensing or distribution terms
- installation, verification, or publishing instructions
