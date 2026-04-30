# Resume Crafter

Resume Crafter is a four-skill package for turning chat requirements, `.docx` resumes, `.pdf` resumes, and screenshots into a polished LaTeX resume plus compiled PDF.

## Use Cases

- create a new resume from structured chat input
- convert an existing resume into editable LaTeX
- adapt a CV for academic applications
- rewrite an industry resume for ATS-aware delivery

## Guarantees

- facts are extracted and labeled before drafting
- blocking facts stop the flow; non-blocking uncertainty stays labeled instead of guessed
- generated work stays inside a fresh workspace
- final delivery targets `output/resume.tex` and `output/resume.pdf`

## Repository Layout

- `skills/`: bundled runtime skills
- `templates/`: academic and industry LaTeX sources
- `tests/`: scenario prompts and baseline notes
- `docs/`: architecture, contribution, and publishing notes

See `INSTALL.md` for agent setup and runtime verification.
