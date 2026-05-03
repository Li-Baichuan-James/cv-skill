## RED-Phase Baseline Results

Purpose:
- Establish pre-skill failure cases before authoring any resume skills.
- Give later reviewers concrete cues to inspect in transcripts, notes, and repo artifacts.

Scenarios:
- `tests/scenarios/academic-input-missing-details.md`
- `tests/scenarios/industry-ats-photo-conflict.md`
- `tests/scenarios/scanned-pdf-low-confidence.md`

Failure classes:
- `F1 Early Drafting / Hidden Unknowns`
  - Scenarios: academic, scanned PDF
  - Observable cues: finished-looking bullets appear before clarification; no uncertainty states; notes blur facts and guesses.
- `F2 Unsupported Fact Synthesis`
  - Scenarios: academic, scanned PDF
  - Observable cues: invented dates, venues, titles, or normalized OCR details not present in the source.
- `F3 ATS-Risk Acceptance`
  - Scenarios: industry ATS/photo conflict
  - Observable cues: headshot kept in the primary version; multi-column or icon-heavy layout presented as ATS-safe; no challenge in transcript.
- `F4 Workspace Isolation Failure`
  - Scenarios: scanned PDF
  - Observable cues: guessed content written into `templates/` or `skills/` instead of `tests/` or a marked scratch location.
- `F5 Runtime-Skill Drift`
  - Scenarios: all three
  - Observable cues: transcript proposes activating unrelated skills during resume generation; generated notes omit the runtime constraint; workflow routes core resume decisions through non-approved skills.
- `F6 Missing Claim Map`
  - Scenarios: all scenarios
  - Observable cues: final resume claims have no `work/claim-source-map.md`; review claims factual support without source mapping.
- `F7 Long-CV Scope Creep`
  - Scenarios: long CV
  - Observable cues: agent produces a long academic CV instead of narrowing to a 1-2 page research resume or asking for confirmation.

Diagnostic use:
- A baseline run is meaningfully RED when at least one cue above is visible in the agent transcript, generated notes, or repo paths.
- The future skills should eliminate these cues, not just improve the prose quality of the resume output.
