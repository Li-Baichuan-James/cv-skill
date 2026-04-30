# Install Resume Crafter

Agent-facing setup for local skill environments.

## Supported Environments

- Claude Code
- OpenCode
- Codex-style local skill runners

## Skill Install Conventions

- Claude Code: install the four bundled folders under a Claude skills location such as project-local `.claude/skills/` or your user-level Claude skills directory if your setup uses one.
- OpenCode: install the four bundled folders under your OpenCode skills directory, commonly `~/.config/opencode/skills/`.
- Codex-style environments: install the four bundled folders into the tool's local skills, prompts, or agent-plugin directory, keeping each skill as its own folder.

## Required Skills

- bundled: `resume-crafter`, `resume-intake-and-extraction`, `resume-authoring-and-assembly`, `resume-review-and-delivery`
- upstream: `docx` for `.docx` sources
- upstream: `pdf` for `.pdf` sources
- host capability: platform-native image reading or OCR for screenshots and image resumes

## Runtime Warning

For resume generation, keep the content runtime limited to the four bundled resume skills, plus upstream `docx` or `pdf` only when the input type requires them. Host-default or platform-required process skills are acceptable if the platform injects them automatically, but they should not be used to make resume content, fact, layout, or delivery decisions.

## Install Steps

1. Clone or copy this repository locally.
2. Keep the full repository checkout intact so `skills/`, `templates/`, `docs/`, `examples/`, and `tests/` remain siblings.
3. Install the four folders under `skills/` into your platform's skill directory.
4. If your platform copies skill folders out of the repository, also keep the repository checkout available as the asset root for `templates/`, `docs/`, `examples/`, and `tests/`.
5. Keep `docs/` and `tests/` available for operator reference and verification.

## Asset Layout Rule

The four installed skill folders are only the runtime entrypoints. The repository checkout remains the canonical asset root for:

- `templates/`
- `docs/`
- `examples/`
- `tests/`

Do not move a single skill folder by itself and expect bundled templates to travel with it unless your platform supports that packaging model explicitly.

## Local Dependencies

Resume Crafter expects a local document toolchain for extraction and PDF assembly.

Run these checks:

- `pandoc --version`
- `xelatex --version`

If `pandoc` is missing, conversion and preprocessing workflows may fail.
If `xelatex` is missing, final PDF generation will fail.

Also install whatever the upstream `docx` and `pdf` skills require in your environment.

For screenshot or image-only resumes, make sure your host platform can already read images or perform OCR. Resume Crafter does not add a separate image-processing skill dependency in version one.

## Simple Verification

1. Ask the agent to use `resume-crafter` on a short plain-text resume input.
2. Confirm it creates a fresh workspace with `input/`, `work/`, and `output/`.
3. Confirm it stops for missing identity, role, date-range, chronology, publication, or metric facts that would make the resume misleading.
4. Confirm it chooses academic or industry mode intentionally.
5. Confirm it produces `output/resume.tex` and `output/resume.pdf`.
6. Confirm low-confidence but non-blocking details stay labeled in working notes instead of being guessed into final resume bullets.
7. Confirm it does not use unrelated content-making skills during the run.
