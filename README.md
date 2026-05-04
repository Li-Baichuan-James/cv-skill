# Resume Crafter

Resume Crafter is a four-skill package that turns chat notes, Word documents, PDFs, screenshots, or existing resume material into a factual 1-2 page LaTeX resume plus PDF when local tooling is available.

## Primary Entrypoint

Invoke `resume-crafter` for user-facing resume work.

Supporting skills:

- `resume-intake-and-extraction`
- `resume-authoring-and-assembly`
- `resume-review-and-delivery`

## Use Cases

- Create a new resume from chat-provided requirements and source material.
- Convert an existing resume to LaTeX.
- Adapt research or academic material to a concise 1-2 page resume.
- Rewrite an industry resume for ATS-focused review.

## Scope Warning

This package does not produce long academic CVs. If a user asks for a long CV, offer a concise research resume instead and keep the deliverable within the 1-2 page resume scope.

## Quickstart

1. Install the four folders in `skills/` into the agent skill directory.
2. Keep the repository checkout available as the asset root for templates, examples, tests, and documentation.
3. Record the checkout path as `CV_SKILL_ROOT`, for example `C:\Users\lbc\.config\opencode\cv-skill`.
4. Ensure `xelatex --version` works if PDF builds are required.
5. Prompt the agent with the primary skill and asset root, for example: `Use resume-crafter. CV_SKILL_ROOT=C:\Users\lbc\.config\opencode\cv-skill. Build a 1-2 page ATS resume from the attached resume and my target role notes.`

## Asset Root Contract

`CV_SKILL_ROOT` is the absolute path to the full repository checkout. Installed skills are runtime entrypoints only. Templates, examples, tests, docs, and verification tools stay under `CV_SKILL_ROOT`. If `CV_SKILL_ROOT` is unknown, the agent must ask for it before using repository assets.

## Guarantees

- Extraction happens before drafting.
- Blockers stop the flow instead of being guessed around.
- Every final claim is resolved in `work/claim-source-map.md`.
- Each run uses a fresh workspace.
- Output-local reproducible source and PDF are delivered when tooling is available.

## Template Matrix

| Template | Intended use |
| --- | --- |
| `templates/industry/ats` | ATS-friendly industry resumes. |
| `templates/industry/photo` | Industry resumes where a photo layout is explicitly appropriate. |
| `templates/research/ats` | Concise research resumes adapted from academic material. |
| `templates/zh/standard` | Chinese-language standard resume format. |

## Expected Workspace

```text
resume-workspace-YYYYMMDD-HHMMSS/
  work/
    claim-source-map.md
    common/
      resume.cls
  output/
    resume.tex
    resume.pdf
    common/
      resume.cls
```

Compile from the directory containing `resume.tex`:

```powershell
xelatex -interaction=nonstopmode -halt-on-error resume.tex
```

If `xelatex` is unavailable, provide `output/resume.tex` and `output/common/resume.cls`, and report that PDF output is unavailable because the LaTeX engine is missing.

## Repository Layout

```text
skills/                  Four installed skill entrypoints
templates/               Resume templates and shared LaTeX class assets
examples/                Example inputs and expected workflows
tests/                   Skill and packaging test fixtures
docs/                    Architecture, contribution, publishing, and verification docs
tools/verify.ps1         Repository verification helper
```
