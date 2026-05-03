# Industry Example Output

This directory documents the expected shape of a sanitized industry resume run.

Expected final delivery contract:

- `resume.tex`: the finalized industry LaTeX resume
- `resume.pdf`: the compiled industry PDF

Expected working evidence before delivery:

- `work/extracted.md`: normalized source material
- `work/requirements-summary.md`: target, gaps, and selected template, usually `templates/industry/ats/`
- `work/claim-source-map.md`: every final claim mapped to source material
- `work/review.md`: factual, ATS, photo, and build review notes

Keep these constraints:

- runtime jobs should write to their own workspace `output/` directory, not directly into `examples/`
- any checked-in example must preserve ATS-oriented choices that were actually produced and reviewed
- do not add photos, icon-heavy variants, or invented impact metrics and then present them as ATS-safe examples
- if a photo version is checked in, label it as non-ATS and keep the ATS version separate
