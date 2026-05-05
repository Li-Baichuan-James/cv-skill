# Verification

Use this procedure before publishing or after changing skills, templates, tests, examples, or install docs.

## Windows Quick Check

```powershell
tools/verify.ps1
```

The script writes temporary compile workspaces under the OS temp directory when `xelatex` is installed. It must not create generated files in repository source paths. Publishing a verified release requires running compile checks in an environment with `xelatex`.

## Manual Checks

1. Confirm all bundled skill files exist:
   - `skills/resume-crafter/SKILL.md`
   - `skills/resume-intake-and-extraction/SKILL.md`
   - `skills/resume-authoring-and-assembly/SKILL.md`
   - `skills/resume-review-and-delivery/SKILL.md`
2. Confirm each `SKILL.md` frontmatter contains `name` and `description`.
3. Confirm these template files exist:
   - `templates/common/resume.cls`
   - `templates/industry/ats/resume.tex`
   - `templates/industry/photo/resume.tex`
   - `templates/research/ats/resume.tex`
   - `templates/zh/standard/resume.tex`
4. Copy each template variant to a temp folder with `common/resume.cls` and run this command in an environment with `xelatex`:

```powershell
xelatex -interaction=nonstopmode -halt-on-error resume.tex
```

5. Confirm no accidental private or binary assets are present: `*.otf`, `*.ttf`, `*.woff`, `*.woff2`, `*.jpg`, `*.jpeg`, `*.png`, `*.pdf`, `*.docx`.
6. Confirm every file in `tests/scenarios/` is listed in `tests/baseline-results.md`.
7. Confirm every scenario contains `Prompt`, `Fixture`, `Expected Behavior`, `Forbidden Behavior`, and `Pass/Fail Checklist`.
8. Confirm `examples/outputs/industry-example/` contains:
   - `work/requirements-summary.md`
   - `work/claim-source-map.md`
   - `work/review.md`
    - `output/resume.tex`
    - `output/common/resume.cls`
9. Confirm the industry example claim map uses:

```markdown
| Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling |
```

10. Confirm no generated PDF or LaTeX auxiliary files are left in `examples/outputs/industry-example/output/`.
11. Confirm runtime delivery docs require `output/resume.pdf` and do not present source files alone as final delivery.
