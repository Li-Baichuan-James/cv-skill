# Contributing

Contributions should preserve the package's operational discipline, not just its output quality.

## Expectations

- preserve factual safety, confidence labeling, and stop-before-guessing behavior
- preserve the stop threshold for `missing-blocking` and unsafe facts; only non-blocking uncertainty may proceed as `needs-confirmation` or `omitted-unresolved`
- preserve `work/claim-source-map.md` as the factual review backbone
- keep runtime dependency discipline tight; do not add unrelated content-making skills to the core flow
- treat upstream `docx` and `pdf` as source-type adapters, not general decision-makers
- preserve template intent across industry ATS, industry photo, research ATS, and Chinese standard variants
- keep generated resume artifacts inside run-specific workspaces, not repository source paths
- do not add copyrighted fonts or assets; prefer documented Noto CJK setup over vendored Adobe fonts

## Review Focus

Check that changes still preserve workspace isolation, template selection intent, factual traceability, stop-versus-proceed uncertainty rules, 1-2 page scope, and the `output/resume.tex` plus `output/resume.pdf` delivery contract.
