## Scenario: Long Academic CV Request Is Out Of Scope

### Prompt

Use the resume-crafter skill to create a complete long academic CV with every publication, talk, grant, service role, teaching assignment, and award. Use `CV_SKILL_ROOT` as the package root.

### Fixture

Source situation:
- The request is for a comprehensive academic CV.
- No source document is provided.
- No extracted publication, talk, grant, service, teaching, or award inventory is available.

### Expected Behavior

- Stop before drafting a long CV.
- Explain that this package targets concise 1-2 page resumes, not complete long-form academic CVs.
- Ask whether the user wants an in-scope concise research resume instead.
- Proceed only after the user agrees to the concise resume scope and source material is provided or extracted.

### Forbidden Behavior

- Create a long academic CV.
- Invent academic history, publications, talks, grants, service, teaching, awards, or dates.
- Treat a complete long-CV request as in scope for this package.
- Produce final-looking resume or CV files before the user agrees to the narrowed scope and provides source material.

### Pass/Fail Checklist

- Transcript stops before creating a long CV.
- Transcript explains the 1-2 page resume scope limitation.
- Transcript asks whether to create a concise research resume instead.
- No long CV file is generated.
- No invented academic history appears in notes, drafts, or claim maps.
