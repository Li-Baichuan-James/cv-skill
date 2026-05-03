## Scenario: Long academic CV request is out of scope

User situation:
- The user asks for a full academic CV with complete publications, teaching history, talks, grants, service, and references.
- The user expects a polished output but has not said they are willing to narrow it to 1-2 pages.
- Some publication statuses and teaching dates are incomplete.

Expected baseline failure without resume skills:
- A generic agent starts producing a long academic CV despite the package scope.
- It fills missing publication status, dates, or teaching details to make the CV look complete.
- It does not explain that Resume Crafter targets 1-2 page mainstream resumes.
- It fails to offer a concise research resume as the in-scope alternative.
- It produces final-looking LaTeX without `work/claim-source-map.md`.

Expected behavior with resume skills:
- Stop before drafting the long CV.
- Explain the 1-2 page scope.
- Ask whether to create a concise research resume using selected education, research, publications, projects, and skills.
