$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$Failures = New-Object System.Collections.Generic.List[string]

function Resolve-RepoPath {
    param([string]$Path)
    return Join-Path $RepoRoot $Path
}

function Write-Check {
    param(
        [bool]$Passed,
        [string]$Message
    )

    if ($Passed) {
        Write-Host "PASS $Message"
    } else {
        Write-Host "FAIL $Message"
        $Failures.Add($Message) | Out-Null
    }
}

function Write-Skip {
    param([string]$Message)
    Write-Host "SKIP $Message" -ForegroundColor Yellow
}

function Test-SkillFrontmatter {
    param([string]$Content)

    $FrontmatterMatch = [regex]::Match($Content, "(?s)\A---[ \t]*(?:\r?\n)(?<Frontmatter>.*?)(?:\r?\n)---[ \t]*(?:\r?\n|\z)")
    if (-not $FrontmatterMatch.Success) {
        return $false
    }

    $Frontmatter = $FrontmatterMatch.Groups["Frontmatter"].Value
    return ($Frontmatter -match "(?m)^name:") -and ($Frontmatter -match "(?m)^description:")
}

function Test-FileExists {
    param([string]$RelativePath)
    $FullPath = Resolve-RepoPath $RelativePath
    Write-Check (Test-Path -LiteralPath $FullPath -PathType Leaf) "$RelativePath exists"
}

function Get-TextFile {
    param([string]$RelativePath)
    $FullPath = Resolve-RepoPath $RelativePath
    if (Test-Path -LiteralPath $FullPath -PathType Leaf) {
        return Get-Content -LiteralPath $FullPath -Raw
    }
    return $null
}

function Test-Contains {
    param(
        [string]$RelativePath,
        [string]$Pattern,
        [string]$Message
    )

    $Content = Get-TextFile $RelativePath
    Write-Check (($null -ne $Content) -and ($Content -match $Pattern)) $Message
}

function Test-NotContains {
    param(
        [string]$RelativePath,
        [string]$Pattern,
        [string]$Message
    )

    $Content = Get-TextFile $RelativePath
    Write-Check (($null -ne $Content) -and ($Content -notmatch $Pattern)) $Message
}

$SkillFiles = @(
    "skills/resume-crafter/SKILL.md",
    "skills/resume-intake-and-extraction/SKILL.md",
    "skills/resume-authoring-and-assembly/SKILL.md",
    "skills/resume-review-and-delivery/SKILL.md"
)

foreach ($SkillFile in $SkillFiles) {
    $FullPath = Resolve-RepoPath $SkillFile
    $Exists = Test-Path -LiteralPath $FullPath -PathType Leaf
    Write-Check $Exists "$SkillFile exists"

    if ($Exists) {
        $Content = Get-Content -LiteralPath $FullPath -Raw
        $HasFrontmatter = Test-SkillFrontmatter $Content
        Write-Check $HasFrontmatter "$SkillFile has frontmatter name and description"
    }
}

$TemplateFiles = @(
    "templates/common/resume.cls",
    "templates/industry/ats/resume.tex",
    "templates/industry/photo/resume.tex",
    "templates/research/ats/resume.tex",
    "templates/zh/standard/resume.tex"
)

foreach ($TemplateFile in $TemplateFiles) {
    Test-FileExists $TemplateFile
}

$BaselinePath = Resolve-RepoPath "tests/baseline-results.md"
$Baseline = Get-TextFile "tests/baseline-results.md"
Write-Check ($null -ne $Baseline) "tests/baseline-results.md exists"

$ScenarioDir = Resolve-RepoPath "tests/scenarios"
if (Test-Path -LiteralPath $ScenarioDir -PathType Container) {
    $ScenarioFiles = Get-ChildItem -LiteralPath $ScenarioDir -Filter "*.md" -File
    foreach ($ScenarioFile in $ScenarioFiles) {
        $RelativeScenario = "tests/scenarios/$($ScenarioFile.Name)"
        $Listed = ($null -ne $Baseline) -and ($Baseline -like "*$RelativeScenario*")
        Write-Check $Listed "$RelativeScenario is listed in tests/baseline-results.md"

        $ScenarioContent = Get-Content -LiteralPath $ScenarioFile.FullName -Raw
        foreach ($Heading in @("Prompt", "Fixture", "Expected Behavior", "Forbidden Behavior", "Pass/Fail Checklist")) {
            $HasHeading = $ScenarioContent -match ("(?m)^### " + [regex]::Escape($Heading) + "\s*$")
            Write-Check $HasHeading "$RelativeScenario contains ### $Heading"
        }
    }
} else {
    Write-Check $false "tests/scenarios directory exists"
}

$GoldenFiles = @(
    "examples/outputs/industry-example/work/requirements-summary.md",
    "examples/outputs/industry-example/work/claim-source-map.md",
    "examples/outputs/industry-example/work/review.md",
    "examples/outputs/industry-example/output/resume.tex",
    "examples/outputs/industry-example/output/common/resume.cls"
)

foreach ($GoldenFile in $GoldenFiles) {
    Test-FileExists $GoldenFile
}

$ClaimMapHeader = "| Claim | Source artifact | Source locator | Raw wording or user confirmation | State | Final handling |"
$ClaimMap = Get-TextFile "examples/outputs/industry-example/work/claim-source-map.md"
Write-Check (($null -ne $ClaimMap) -and ($ClaimMap -like "*$ClaimMapHeader*")) "industry example claim map has audit header"

$OutputResume = Get-TextFile "examples/outputs/industry-example/output/resume.tex"
Write-Check (($null -ne $OutputResume) -and ($OutputResume -match "\\documentclass\{common/resume\}")) "industry example output uses \\documentclass{common/resume}"

$ContractFiles = @(
    "skills/resume-crafter/SKILL.md",
    "skills/resume-review-and-delivery/SKILL.md",
    "docs/architecture.md",
    "docs/contributing.md",
    "README.md"
)

foreach ($ContractFile in $ContractFiles) {
    Test-NotContains $ContractFile "(?i)(resume\.pdf[^\r\n]*(when available|when PDF tooling is available|when local.*available|when xelatex is available)|If .*xelatex.*unavailable.*output/resume\.tex|If PDF build tooling is unavailable.*deliver|source-only)" "$ContractFile does not allow source-only final delivery"
}

Test-Contains "skills/resume-crafter/SKILL.md" "output/resume\.pdf.*required final deliverable" "resume-crafter requires output/resume.pdf as final deliverable"
Test-Contains "skills/resume-review-and-delivery/SKILL.md" "unavailable.*attempt.*install" "review-and-delivery attempts install when PDF tooling is unavailable"
Test-Contains "skills/resume-review-and-delivery/SKILL.md" "blocker" "review-and-delivery treats failed PDF generation as blocker"
Test-Contains "examples/outputs/academic-example/README.md" "output/resume\.tex" "academic example uses output/resume.tex"
Test-Contains "examples/outputs/academic-example/README.md" "output/common/resume\.cls" "academic example uses output/common/resume.cls"
Test-Contains "examples/outputs/academic-example/README.md" "output/resume\.pdf" "academic example uses output/resume.pdf"

$OutputDir = Resolve-RepoPath "examples/outputs/industry-example/output"
if (Test-Path -LiteralPath $OutputDir -PathType Container) {
    $AuxPatterns = @("*.pdf", "*.aux", "*.log", "*.out", "*.toc", "*.fls", "*.fdb_latexmk", "*.synctex.gz")
    $AuxFiles = @()
    foreach ($Pattern in $AuxPatterns) {
        $AuxFiles += Get-ChildItem -LiteralPath $OutputDir -Filter $Pattern -File -Recurse
    }
    Write-Check ($AuxFiles.Count -eq 0) "examples/outputs/industry-example/output has no generated PDF or LaTeX auxiliary files"
} else {
    Write-Check $false "examples/outputs/industry-example/output directory exists"
}

$BinaryPatterns = @("*.otf", "*.ttf", "*.woff", "*.woff2", "*.jpg", "*.jpeg", "*.png", "*.pdf", "*.docx")
$AllowedBinaryAssets = @(
    "assets/cv-skill-readme.jpg"
)
$BinaryMatches = @()
foreach ($Pattern in $BinaryPatterns) {
    $BinaryMatches += Get-ChildItem -LiteralPath $RepoRoot -Filter $Pattern -File -Recurse -Force | Where-Object {
        $RelativePath = $_.FullName.Substring($RepoRoot.Length).TrimStart("\", "/") -replace "\\", "/"
        ($_.FullName -notmatch "[\\/]\.git[\\/]") -and ($AllowedBinaryAssets -notcontains $RelativePath)
    }
}

if ($BinaryMatches.Count -eq 0) {
    Write-Check $true "no unexpected binary/private asset patterns found"
} else {
    foreach ($Match in $BinaryMatches) {
        $Relative = $Match.FullName.Substring($RepoRoot.Length).TrimStart("\", "/")
        Write-Check $false "unexpected binary/private asset: $Relative"
    }
}

$XeLaTeX = Get-Command xelatex -ErrorAction SilentlyContinue
if ($null -eq $XeLaTeX) {
    Write-Check $false "xelatex is required for verified releases"
} else {
    $CommonClass = Resolve-RepoPath "templates/common/resume.cls"
    foreach ($TemplateFile in $TemplateFiles | Where-Object { $_ -ne "templates/common/resume.cls" }) {
        $TemplatePath = Resolve-RepoPath $TemplateFile
        if ((Test-Path -LiteralPath $TemplatePath -PathType Leaf) -and (Test-Path -LiteralPath $CommonClass -PathType Leaf)) {
            $TempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("cv-skill-verify-" + [System.Guid]::NewGuid().ToString("N"))
            $TempCommon = Join-Path $TempDir "common"
            New-Item -ItemType Directory -Force -Path $TempCommon | Out-Null
            Copy-Item -LiteralPath $TemplatePath -Destination (Join-Path $TempDir "resume.tex")
            Copy-Item -LiteralPath $CommonClass -Destination (Join-Path $TempCommon "resume.cls")

            Push-Location $TempDir
            try {
                & xelatex -interaction=nonstopmode -halt-on-error resume.tex | Out-Null
                Write-Check ($LASTEXITCODE -eq 0) "$TemplateFile compiles with xelatex"
            } catch {
                Write-Check $false "$TemplateFile compiles with xelatex"
            } finally {
                Pop-Location
                Remove-Item -LiteralPath $TempDir -Recurse -Force -ErrorAction SilentlyContinue
            }
        } else {
            Write-Check $false "$TemplateFile compile inputs exist"
        }
    }
}

if ($Failures.Count -gt 0) {
    Write-Host "FAIL verification failed with $($Failures.Count) issue(s)"
    exit 1
}

Write-Host "PASS verification passed"
exit 0
