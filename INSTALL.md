# Install Resume Crafter

## Supported Environments

- Claude Code
- OpenCode
- Codex-style local skill runners

## Required Skills And Tools

| Dependency | Required | Purpose |
| --- | --- | --- |
| `resume-crafter` | Yes | Primary user-facing entrypoint. |
| `resume-intake-and-extraction` | Yes | Normalizes chat, docx, PDF, screenshot, and mixed source material. |
| `resume-authoring-and-assembly` | Yes | Builds the 1-2 page LaTeX resume source. |
| `resume-review-and-delivery` | Yes | Reviews factual safety and packages final outputs. |
| Upstream `docx` skill | When needed | Reads or extracts Word resume sources. |
| Upstream `pdf` skill | When needed | Reads, extracts, or inspects PDF resume sources. |
| Host image/OCR capability | When needed | Extracts screenshot or scanned-image material. |
| `xelatex` | For PDF builds | Compiles `resume.tex` to `resume.pdf`. |
| `pandoc` | Optional | Supports document conversion workflows when present. |

## Runtime Warning

At content runtime, use only the four bundled resume skills plus upstream `docx` and `pdf` skills when those source formats require them. Do not route resume content through unrelated skills.

## Asset Root Contract

`CV_SKILL_ROOT` must be the absolute path to the intact full repository checkout. Installed skill folders are entrypoints; templates, examples, tests, docs, and `tools/verify.ps1` remain under `CV_SKILL_ROOT`. If the variable is missing or ambiguous, the agent must ask the user for the checkout path.

## Install Steps

1. Clone or copy this repository.
2. Keep the checkout intact and available as the asset root.
3. Install the four bundled skill folders into the target agent skill directory.
4. Record the checkout path as `CV_SKILL_ROOT`.
5. Run verification with `tools/verify.ps1` when PowerShell is available, or follow `docs/verification.md` manually.

## PowerShell Example

```powershell
$CV_SKILL_ROOT = "C:\Users\lbc\.config\opencode\cv-skill"
$SkillDir = "$HOME\.config\opencode\skills"
New-Item -ItemType Directory -Force -Path $SkillDir | Out-Null
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-crafter" $SkillDir
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-intake-and-extraction" $SkillDir
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-authoring-and-assembly" $SkillDir
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-review-and-delivery" $SkillDir
& "$CV_SKILL_ROOT\tools\verify.ps1"
```

## POSIX Example

```sh
CV_SKILL_ROOT="$HOME/.config/opencode/cv-skill"
SKILL_DIR="$HOME/.config/opencode/skills"
mkdir -p "$SKILL_DIR"
cp -R "$CV_SKILL_ROOT/skills/resume-crafter" "$SKILL_DIR/"
cp -R "$CV_SKILL_ROOT/skills/resume-intake-and-extraction" "$SKILL_DIR/"
cp -R "$CV_SKILL_ROOT/skills/resume-authoring-and-assembly" "$SKILL_DIR/"
cp -R "$CV_SKILL_ROOT/skills/resume-review-and-delivery" "$SKILL_DIR/"
pwsh "$CV_SKILL_ROOT/tools/verify.ps1"
```

## Copy/Paste Agent Setup

```text
Set CV_SKILL_ROOT to the absolute checkout path.
Set the target skill directory for this agent.
Copy these four folders from CV_SKILL_ROOT/skills into the target skill directory:
- resume-crafter
- resume-intake-and-extraction
- resume-authoring-and-assembly
- resume-review-and-delivery
Check xelatex with: xelatex --version
Check each installed skill has valid frontmatter.
Run a dry verification using examples/inputs/sample-industry-resume.md.
The dry run must produce work/common/resume.cls and output/common/resume.cls.
```

## Local Dependencies

Check optional converters and PDF build tools:

```sh
pandoc --version
xelatex --version
```

For Chinese-language resumes, ensure a CJK-capable font is installed and available to XeLaTeX. Word inputs require the upstream `docx` skill and its dependencies. PDF inputs require the upstream `pdf` skill and its dependencies. Screenshots or scanned documents require host image/OCR support; if OCR is unavailable, stop and ask for text or a machine-readable source.

## Simple Verification

1. Run `tools/verify.ps1`, or follow `docs/verification.md` if PowerShell is unavailable.
2. Confirm the claim map uses the six-column schema: `Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling`.
3. Confirm `output/common/resume.cls` exists beside `output/resume.tex`.
4. Confirm runtime instructions do not require unrelated skills beyond the bundled resume skills and upstream `docx`/`pdf` adapters when needed.
