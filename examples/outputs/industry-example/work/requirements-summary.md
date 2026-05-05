# Requirements Summary

## Target

- Audience: industry software engineering roles
- Format: ATS-friendly 1-2 page resume
- Template: `templates/industry/ats/`
- Photo: omitted from primary version because ATS compatibility is the target

## Source

- `examples/inputs/sample-industry-resume.md`

## Resolved Facts

- Candidate name, contact details, experience, projects, and skills are provided in the sample input.
- No education or candidate location is provided in the sample input.
- Final prose uses only source-backed facts from the sample input.

## Blocking Items

- None for this sanitized example.

## Omissions

- No blocking facts were omitted.

## Build Notes

- `output/resume.tex` uses `\documentclass{common/resume}`.
- `output/common/resume.cls` is included so the output folder is rebuildable.
- Runtime final delivery requires `output/resume.pdf`; generated PDFs are not checked into this repository example.
