# Resume Crafter

Resume Crafter is a four-skill package for turning chat requirements, `.docx` resumes, `.pdf` resumes, and screenshots into a polished 1-2 page LaTeX resume plus compiled PDF.

## Use Cases

- create a new resume from structured chat input
- convert an existing resume into editable LaTeX
- adapt research or academic material into a concise 1-2 page resume
- rewrite an industry resume for ATS-aware delivery

Resume Crafter does not target long academic CVs. If a user asks for one, the workflow should offer a concise research resume instead.

## Quickstart

1. Install the four folders in `skills/` into your agent skill directory.
2. Keep this repository checkout available as the asset root for `templates/`, `examples/`, and `tests/`.
3. Ensure `xelatex --version` works locally.
4. Ask your agent: `Use resume-crafter to create a 1-2 page ATS-friendly resume from the material I provide. Do not invent facts; ask about blocking unknowns first.`

## Guarantees

- facts are extracted and labeled before drafting
- blocking facts stop the flow; non-blocking uncertainty stays labeled instead of guessed
- every final claim is mapped to a `resolved` entry in `work/claim-source-map.md`
- generated work stays inside a fresh workspace
- final delivery targets `output/resume.tex` and `output/resume.pdf`

## Template Matrix

| Template | Use for | ATS | Photo |
|---|---|---:|---:|
| `templates/industry/ats/` | English industry resumes | yes | no |
| `templates/industry/photo/` | user-approved visual resumes | no | yes |
| `templates/research/ats/` | concise research or academic resumes | yes | no |
| `templates/zh/standard/` | mainstream Chinese resumes | depends on final layout | no |

All templates are XeLaTeX skeletons for the agent to fill from confirmed facts. They are not a data-rendering engine.

## Expected Workspace

```text
resume-workspace-YYYYMMDD-HHMMSS/
  input/
  work/
    common/
      resume.cls
    extracted.md
    requirements-summary.md
    claim-source-map.md
    resume.tex
    review.md
    build.log
  output/
    resume.tex
    resume.pdf
```

Generated `work/resume.tex` should use `\documentclass{common/resume}` and compile from the generated workspace so final source is reproducible without the repository's relative template paths.

## Repository Layout

- `skills/`: bundled runtime skills
- `templates/`: shared LaTeX support and resume variants
- `tests/`: scenario prompts and baseline notes
- `docs/`: architecture, contribution, and publishing notes

See `INSTALL.md` for agent setup and runtime verification.
