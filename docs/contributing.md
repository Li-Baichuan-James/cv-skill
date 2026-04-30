# Contributing

Contributions should preserve the package's operational discipline, not just its output quality.

## Expectations

- preserve factual safety, confidence labeling, and stop-before-guessing behavior
- preserve the stop threshold for blocking facts and unsafe facts; only non-blocking uncertainty may proceed with labels in working notes
- keep runtime dependency discipline tight; do not add unrelated content-making skills to the core flow
- treat upstream `docx` and `pdf` as source-type adapters, not general decision-makers
- preserve template intent between `academic` and `industry` variants
- keep generated resume artifacts inside run-specific workspaces, not repository source paths

## Review Focus

Check that changes still preserve workspace isolation, template selection intent, factual traceability, stop-versus-proceed uncertainty rules, and the `output/resume.tex` plus `output/resume.pdf` delivery contract.
