---
name: resume-review-and-delivery
description: Use when a LaTeX resume draft exists and needs factual review, ATS or research-resume risk checks, build validation, packaging, and final delivery.
---

# Resume Review And Delivery

## Overview

Review the draft for factual safety and presentation risk, compile the PDF, and package the final outputs without overstating confidence.

## Preconditions

Before review, require these files in the current workspace:

- `work/extracted.md`
- `work/requirements-summary.md`
- `work/claim-source-map.md`
- `work/resume.tex`
- `work/common/resume.cls`
- `output/` directory, or permission to create it inside the current workspace

If any are missing, return a blocker instead of finalizing.

## Review Checklist

- `work/claim-source-map.md` uses the six-column schema: `Claim`, `Source artifact`, `Source locator`, `Raw wording or user confirmation`, `State`, `Final handling`
- every final factual claim is supported by a `resolved` entry in `work/claim-source-map.md`
- every `resolved` entry has a non-empty source artifact, source locator, and raw wording or user confirmation; reject circular rows that merely restate the final prose as evidence
- no `[confirm]` markers or unresolved placeholders remain in a version presented as final
- no `\placeholder{...}` tokens or stock template bullets remain in a version presented as final
- no `missing-blocking` claims remain unless audited as omitted and absent from final prose
- every omitted blocking item records reason, explicit user approval, and impact on final wording
- no `needs-confirmation` or `omitted-unresolved` claim appears in final resume prose
- no quality-critical content implied by the user's requested language, market, or format is missing unless the omission audit records explicit user approval
- for Chinese resumes, if the source lacks a confirmed Chinese display name, verify that user confirmation or explicit user-approved omission exists before delivery
- quality-critical omissions without explicit user approval are blockers, even if the PDF builds successfully
- no visible operator guidance, template notes, or non-ATS warnings remain in final resume prose
- wording is professional and internally consistent
- ATS, photo, language, and layout risks are called out when relevant
- page count fits the target context
- links and contact information appear intentional
- `work/requirements-summary.md` records the selected template family, resolved `CV_SKILL_ROOT`, and copied class source path

## Build Requirements

- Compile `work/resume.tex` with XeLaTeX from `work/`, not from the repository template directory.
- Require `work/common/resume.cls` and `\documentclass{common/resume}` so the build is workspace-local.
- Check for `xelatex` before compiling. If unavailable, attempt to install or activate a XeLaTeX-capable TeX distribution, then re-check `xelatex --version`.
- If automatic installation is blocked by permissions, network, policy, or unsupported platform, return a blocker. Do not finalize with source files alone.
- Create `output/` and `output/common/` before copying final files.
- Copy final source into `output/resume.tex`.
- Copy `work/common/resume.cls` to `output/common/resume.cls`.
- Compile `output/resume.tex` from inside `output/` and require `output/resume.pdf` to exist before final delivery.
- Preserve review notes and build logs under `work/`
- Keep all outputs inside the current workspace folder

Recommended command block:

```powershell
if (-not (Get-Command xelatex -ErrorAction SilentlyContinue)) {
  if (Get-Command winget -ErrorAction SilentlyContinue) { winget install --id MiKTeX.MiKTeX -e --accept-package-agreements --accept-source-agreements }
  elseif (Get-Command choco -ErrorAction SilentlyContinue) { choco install miktex -y }
  elseif (Get-Command scoop -ErrorAction SilentlyContinue) { scoop install latex }
}
if (-not (Get-Command xelatex -ErrorAction SilentlyContinue)) { throw "BLOCKER: xelatex unavailable; cannot produce required output/resume.pdf" }
Push-Location work; xelatex -interaction=nonstopmode -halt-on-error resume.tex *> build.log; Pop-Location
New-Item -ItemType Directory -Force output | Out-Null
New-Item -ItemType Directory -Force output/common | Out-Null
Copy-Item work/resume.tex output/resume.tex
Copy-Item work/common/resume.cls output/common/resume.cls
Push-Location output; xelatex -interaction=nonstopmode -halt-on-error resume.tex *> ../work/output-build.log; Pop-Location
if (-not (Test-Path output/resume.pdf -PathType Leaf)) { throw "BLOCKER: output/resume.pdf was not produced" }
```

On POSIX systems, prefer the platform package manager when available, such as `brew install --cask mactex-no-gui`, `sudo apt-get install -y texlive-xetex texlive-latex-recommended texlive-fonts-recommended`, or the runner's documented TeX distribution setup. If installation cannot complete non-interactively, return a blocker.

## Failure Handling

- Fix and rebuild only when the issue is a local LaTeX assembly problem inside the current draft, such as escaping, missing braces, package use already implied by the template, or other source-level mistakes that can be corrected without guessing new resume facts or changing scope.
- Stop and report a blocker when the build failure depends on missing user facts, ambiguous content decisions, missing external assets, unavailable tooling, or template changes outside the current resume draft.
- If PDF build tooling is unavailable after attempted installation or activation, preserve the attempted build note/log and return a blocker. `output/resume.tex` and `output/common/resume.cls` may be left in the workspace for debugging, but they are not a completed handoff without `output/resume.pdf`.
- If factual uncertainty remains, return a review state instead of claiming the resume is final.
- If quality-critical content was guessed, silently deleted, or omitted without explicit user approval, return a blocker and route back to intake for confirmation.
- If the draft contains ATS-risk choices such as a photo or multi-column layout, state that explicitly and confirm that the delivered version matches the user's accepted tradeoff.

## Rework Routing

- Factual/source blocker: return to `resume-intake-and-extraction`.
- Wording, section order, page-count, or template blocker: return to `resume-authoring-and-assembly`.
- Local LaTeX syntax or packaging issue: fix here and rebuild.
- Tooling or environment blocker: report through `resume-crafter`; final delivery is blocked until PDF generation succeeds.

## Runtime Rule

- Do not bring in unrelated runtime skills during review, packaging, or delivery.
