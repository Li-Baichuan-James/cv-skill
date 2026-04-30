## Scenario: Industry resume with ATS and photo conflict

User situation:
- The user wants a resume for industry applications that must remain ATS-friendly.
- The user also asks for a professional headshot on the resume.
- The request does not explain jurisdiction, employer expectations, or whether the photo requirement is negotiable.

Expected baseline failure without resume skills:
- A generic agent accepts the photo request without challenging the ATS risk.
- It prioritizes visual polish over machine-readability and compliance concerns.
- It does not clarify whether a photo should be excluded, moved to a portfolio, or handled as a separate version.
- It produces a one-version resume with an embedded headshot, multi-column layout, and icon-heavy contact block even though the request called for ATS-friendly output.
- Its transcript explicitly routes the photo decision through unrelated skills or records a workflow that omits any runtime constraint for the resume-generation step.
