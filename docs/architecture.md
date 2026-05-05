# Architecture

## Four-Skill Layout

Resume Crafter is organized as four installed runtime skills:

- `resume-crafter` handles orchestration, user-facing intake, scope control, and `CV_SKILL_ROOT` asset-root resolution.
- `resume-intake-and-extraction` converts chat, docx, PDF, screenshots, and mixed artifacts into normalized factual material.
- `resume-authoring-and-assembly` writes the 1-2 page LaTeX resume using repository templates.
- `resume-review-and-delivery` verifies factual safety, compiles when possible, and prepares final outputs.

## Runtime Flow

1. `resume-crafter` confirms the resume scope and resolves `CV_SKILL_ROOT`.
2. Intake extracts source facts and records uncertainty.
3. Follow-up answers are written back into the workspace before drafting resumes.
4. Authoring chooses the template, copies `templates/common/resume.cls` to `work/common/resume.cls`, writes `work/resume.tex`, and updates the claim map.
5. Review-and-delivery checks safety, risk, and build readiness; copies final source and class to `output/resume.tex` and `output/common/resume.cls`; and verifies an output-local build.
6. Final artifacts are `output/resume.pdf`, `output/resume.tex`, and `output/common/resume.cls`. If the PDF cannot be generated after attempting to install or activate XeLaTeX tooling, final delivery is blocked.

## Asset Root

`CV_SKILL_ROOT` is the absolute path to the full repository checkout. Runtime skill folders can be copied into the agent skill directory, but assets stay in the checkout. Templates, examples, docs, tests, and verification helpers are loaded from `CV_SKILL_ROOT`. If the value is unknown, the runtime must ask the user rather than guessing.

## Workspace Contract

Each run uses a fresh workspace named:

```text
resume-workspace-YYYYMMDD-HHMMSS
```

The workspace contains `work/` for normalized source facts, claim maps, drafts, and review notes, and `output/` for final deliverables.

## Output-Local Template Contract

Both `work` and `output` use the same local document class path:

```latex
\documentclass{common/resume}
```

Both class files must exist:

```text
work/common/resume.cls
output/common/resume.cls
```

Compile from the directory containing `resume.tex`:

```sh
xelatex -interaction=nonstopmode -halt-on-error resume.tex
```

This makes `output/resume.tex` and `output/common/resume.cls` reproducible outside the original workspace. `output/resume.pdf` is the required final deliverable.

## Uncertainty Thresholds

The system must stop for clarification when facts are missing, contradictory, unverifiable, or too vague to write safely. It may omit weak claims, but it must not invent dates, degrees, employers, metrics, publications, awards, tools, or outcomes.

## Claim Map Backbone

| Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling |
| --- | --- | --- | --- | --- | --- |

Every final resume claim must be mapped to source evidence or explicit user confirmation. The final handling column records whether the claim was used, revised, omitted, or blocked.

## Scope

The package creates 1-2 page resumes. It does not create long academic CVs. Academic or research material is condensed into a concise research resume.

## Runtime Boundary

Resume content flows through the four bundled skills. Upstream `docx` and `pdf` skills are adapters only when those input formats require extraction. Unrelated skills must not be introduced into the content path.

## Design Intent

The system favors factual safety, reproducible local outputs, clear user-facing blockers, and small portable LaTeX deliverables over broad document generation features.
