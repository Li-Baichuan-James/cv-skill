# Requirements Summary

## Target

- Audience: industry software/data engineering roles
- Format: ATS-friendly 1-2 page resume
- Template: `templates/industry/ats/`
- Photo: omitted from primary version because ATS compatibility is the target

## Source

- `examples/inputs/sample-industry-resume.md`

## Resolved Facts

- Candidate name, contact details, experience, projects, education, and skills are provided in the sample input.
- Impact metrics used in final prose are copied from the sample input.

## Blocking Items

- None for this sanitized example.

## Omissions

- No blocking facts were omitted.

## Build Notes

- `output/resume.tex` uses `\documentclass{common/resume}`.
- `output/common/resume.cls` is included so the output folder is rebuildable.
