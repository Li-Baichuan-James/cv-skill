# Research Resume Example Output

This directory documents the expected shape of a sanitized research-oriented 1-2 page resume run. Resume Crafter no longer targets long academic CVs.

Expected final delivery contract:

- `resume.tex`: the finalized research-resume LaTeX source
- `resume.pdf`: the compiled research-resume PDF

Expected working evidence before delivery:

- `work/extracted.md`: normalized source material
- `work/requirements-summary.md`: target, gaps, and selected template, usually `templates/research/ats/`
- `work/claim-source-map.md`: every final claim mapped to source material
- `work/review.md`: factual, page-count, and research-presentation review notes

Keep these constraints:

- runtime jobs should write to their own workspace `output/` directory, not directly into `examples/`
- any checked-in example must be sanitized and factually supportable
- do not add guessed details, filled gaps, or fake publications just to make the example look complete
- long publication lists should be narrowed to selected publications or omitted if unresolved
