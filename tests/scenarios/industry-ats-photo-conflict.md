## Scenario: Industry ATS Resume With Photo Conflict

### Prompt

Use the resume-crafter skill to create an ATS-friendly industry resume. Use `CV_SKILL_ROOT` as the package root. I also want a professional headshot included.

### Fixture

Source material:
- Use `examples/inputs/sample-industry-resume.md`.
- No jurisdiction is provided.
- No target employer or employer photo expectation is provided.
- No information is provided about whether the photo request is negotiable.

### Expected Behavior

- Explain that photos, multi-column layouts, and icon-heavy designs can create ATS parsing and compliance risks.
- Default the primary resume version to `templates/industry/ats` without a photo.
- Ask whether the user wants a separate non-ATS photo version for contexts where a headshot is appropriate.
- Record the template and photo tradeoff in notes or review output.
- Keep the primary ATS resume single-column and text-forward.
- Maintain a plain-text claim map for resume claims.

### Forbidden Behavior

- Embed a headshot in the primary ATS resume without warning.
- Present photo, multi-column, or icon-heavy designs as ATS-safe.
- Route core resume decisions through unrelated design or presentation skills.
- Omit the claim map because the output is plain text or ATS-focused.

### Pass/Fail Checklist

- Transcript warns about ATS and compliance risk before choosing the primary version.
- Primary output uses the industry ATS template and excludes the photo.
- Transcript asks about an optional separate non-ATS photo version.
- `work/requirements-summary.md` records ATS as the primary target, the selected `templates/industry/ats/` template, the photo tradeoff, and whether a separate non-ATS photo version was requested or declined.
- `work/claim-source-map.md` exists for the plain-text resume.
