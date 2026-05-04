# Industry Example Output

This directory documents the expected shape of a sanitized industry resume run.

Expected final delivery:

- `output/resume.tex`: the finalized industry LaTeX resume
- `output/common/resume.cls`: output-local resume class for reproducible builds
- `output/resume.pdf`: produced at runtime but not checked into the repository

Expected working evidence:

- `work/requirements-summary.md`: target, selected template, resolved facts, and build notes
- `work/claim-source-map.md`: every final claim mapped to source material or confirmation
- `work/review.md`: factual, ATS, and build review notes

Constraints:

- Runtime jobs write to their own workspace, not directly into `examples/`.
- Checked examples preserve ATS-oriented choices that were actually produced and reviewed.
- No photos, icon-heavy layouts, or invented impact metrics are presented as ATS-safe.
- Any later photo version must be non-ATS, labeled separately, and kept separate from this ATS version.
