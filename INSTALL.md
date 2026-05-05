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
| `xelatex` | Yes | Required to produce the final deliverable `output/resume.pdf`. |
| `pandoc` | Optional | Supports document conversion workflows when present. |

## Runtime Warning

At content runtime, use only the four bundled resume skills plus upstream `docx` and `pdf` skills when those source formats require them. Do not route resume content through unrelated skills.

## Asset Root Contract

`CV_SKILL_ROOT` must be the absolute path to the intact full repository checkout. Installed skill folders are entrypoints; templates, examples, tests, docs, and `tools/verify.ps1` remain under `CV_SKILL_ROOT`. If the variable is missing or ambiguous, the agent must ask the user for the checkout path.

## Installer Inputs

- Repository URL: `https://github.com/Li-Baichuan-James/cv-skill`
- Checkout path: the absolute path where the full repository will remain available as `CV_SKILL_ROOT`
- Runner type: Claude Code, OpenCode, or Codex-style local runner
- Target skill directory: the directory where that runner discovers skills

Common target skill directories:

| Runner | Default skill directory |
| --- | --- |
| OpenCode | `$HOME/.config/opencode/skills` |
| Claude Code | `$HOME/.claude/skills` |
| Codex-style local runner | Runner-specific; inspect runner config or ask the user |

Persist `CV_SKILL_ROOT` in the runner startup environment, project instructions, or runner configuration. Do not rely only on a temporary shell variable unless the same shell launches the agent runtime.

## Install Steps

1. Clone or copy this repository: `git clone https://github.com/Li-Baichuan-James/cv-skill.git <CV_SKILL_ROOT>`.
2. Keep the checkout intact and available as the asset root.
3. Install the four bundled skill folders into the target agent skill directory.
4. Record the checkout path as `CV_SKILL_ROOT`.
5. Ensure `xelatex --version` works. If missing, install a XeLaTeX-capable TeX distribution before final resume delivery.
6. Run verification with `tools/verify.ps1` when PowerShell is available, or follow `docs/verification.md` manually.

## PowerShell Example

```powershell
$CV_SKILL_ROOT = "<ABSOLUTE_PATH_TO_FULL_CV_SKILL_CHECKOUT>"
$SkillDir = "<ABSOLUTE_PATH_TO_THIS_AGENT_SKILL_DIRECTORY>"
New-Item -ItemType Directory -Force -Path $SkillDir | Out-Null
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-crafter" $SkillDir
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-intake-and-extraction" $SkillDir
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-authoring-and-assembly" $SkillDir
Copy-Item -Recurse -Force "$CV_SKILL_ROOT\skills\resume-review-and-delivery" $SkillDir
& "$CV_SKILL_ROOT\tools\verify.ps1"
```

If `xelatex` is missing on Windows, try one available installer:

```powershell
winget install --id MiKTeX.MiKTeX -e --accept-package-agreements --accept-source-agreements
# or: choco install miktex -y
# or: scoop install latex
```

## POSIX Example

```sh
CV_SKILL_ROOT="<ABSOLUTE_PATH_TO_FULL_CV_SKILL_CHECKOUT>"
SKILL_DIR="<ABSOLUTE_PATH_TO_THIS_AGENT_SKILL_DIRECTORY>"
mkdir -p "$SKILL_DIR"
cp -R "$CV_SKILL_ROOT/skills/resume-crafter" "$SKILL_DIR/"
cp -R "$CV_SKILL_ROOT/skills/resume-intake-and-extraction" "$SKILL_DIR/"
cp -R "$CV_SKILL_ROOT/skills/resume-authoring-and-assembly" "$SKILL_DIR/"
cp -R "$CV_SKILL_ROOT/skills/resume-review-and-delivery" "$SKILL_DIR/"
pwsh "$CV_SKILL_ROOT/tools/verify.ps1"
```

If PowerShell is unavailable, perform this manual repository and installation check instead:

```sh
test -f "$CV_SKILL_ROOT/skills/resume-crafter/SKILL.md"
test -f "$CV_SKILL_ROOT/skills/resume-intake-and-extraction/SKILL.md"
test -f "$CV_SKILL_ROOT/skills/resume-authoring-and-assembly/SKILL.md"
test -f "$CV_SKILL_ROOT/skills/resume-review-and-delivery/SKILL.md"
test -f "$CV_SKILL_ROOT/templates/common/resume.cls"
test -f "$CV_SKILL_ROOT/templates/industry/ats/resume.tex"
test -f "$CV_SKILL_ROOT/templates/industry/photo/resume.tex"
test -f "$CV_SKILL_ROOT/templates/research/ats/resume.tex"
test -f "$CV_SKILL_ROOT/templates/zh/standard/resume.tex"
test -d "$SKILL_DIR/resume-crafter"
test -d "$SKILL_DIR/resume-intake-and-extraction"
test -d "$SKILL_DIR/resume-authoring-and-assembly"
test -d "$SKILL_DIR/resume-review-and-delivery"
xelatex --version
```

Then compile each template from a temporary directory containing `resume.tex` and `common/resume.cls`. All compiles must succeed before treating the package as release-verified.

If `xelatex` is missing on POSIX, install a TeX distribution with the platform package manager, for example:

```sh
brew install --cask mactex-no-gui
sudo apt-get install -y texlive-xetex texlive-latex-recommended texlive-fonts-recommended
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
If xelatex is missing, install a XeLaTeX-capable TeX distribution before running final resume delivery.
Check each installed skill has valid frontmatter.
Run a dry verification using examples/inputs/sample-industry-resume.md.
The dry run must produce work/common/resume.cls, output/common/resume.cls, output/resume.tex, and output/resume.pdf.
```

## Local Dependencies

Check optional converters and required PDF build tools:

```sh
pandoc --version
xelatex --version
```

For Chinese-language resumes, ensure a CJK-capable font is installed and available to XeLaTeX. Word inputs require the upstream `docx` skill and its dependencies. PDF inputs require the upstream `pdf` skill and its dependencies. Screenshots or scanned documents require host image/OCR support; if OCR is unavailable, stop and ask for text or a machine-readable source.

## Simple Verification

1. Run `tools/verify.ps1`, or follow `docs/verification.md` if PowerShell is unavailable.
2. Confirm the claim map uses the six-column schema: `Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling`.
3. Confirm `output/common/resume.cls` exists beside `output/resume.tex` and `output/resume.pdf` is generated in runtime dry runs.
4. Confirm runtime instructions do not require unrelated skills beyond the bundled resume skills and upstream `docx`/`pdf` adapters when needed.
