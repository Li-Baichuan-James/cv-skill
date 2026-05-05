# Research Resume Example Output

This directory documents the expected shape of a sanitized research-oriented 1-2 page resume run. Resume Crafter no longer targets long academic CVs.

Expected final delivery contract:

- `output/resume.pdf`: the directly submittable compiled research-resume PDF
- `output/resume.tex`: the finalized research-resume LaTeX source
- `output/common/resume.cls`: output-local class file for reproducible builds

Expected working evidence before delivery:

- `work/extracted.md`: normalized source material
- `work/requirements-summary.md`: target, gaps, and selected template, usually `templates/research/ats/`
- `work/claim-source-map.md`: every final claim mapped to source material
- `work/review.md`: factual, page-count, and research-presentation review notes

Keep these constraints:

- runtime jobs should write to their own workspace `output/` directory, not directly into `examples/`
- source files alone are not final delivery; PDF generation must succeed or return a blocker
- any checked-in example must be sanitized and factually supportable
- do not add guessed details, filled gaps, or fake publications just to make the example look complete
- long publication lists should be narrowed to selected publications or omitted if unresolved
