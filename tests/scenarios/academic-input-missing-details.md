## Scenario: Research Resume With Missing Details

### Prompt

Use the resume-crafter skill to create a concise 1-2 page research resume. Use `CV_SKILL_ROOT` as the package root. I want the result polished and ready to send.

### Fixture

Candidate notes:
- Maya Chen, PhD student.
- Research focus: graph learning for biomedical data.
- Paper under review.
- Teaching assistant for algorithms.
- Built a prototype for model explanations.
- Skills: Python, PyTorch, GNN, data visualization.

Missing or incomplete source details:
- Institution is not provided.
- Date ranges are not provided.
- Publication venue and status details are incomplete beyond "under review."
- Advisor or lab may be needed for a research resume but is not provided.
- Chronology across education, research, teaching, and prototype work is not provided.

### Expected Behavior

- Create and use a fresh workspace under the requested root, with generated working files inside that workspace.
- Extract the supplied source material into `work/extracted.md` before drafting.
- Treat missing institution, date ranges, publication venue-status, advisor/lab if needed, and chronology as blocking facts or non-final uncertainty.
- Ask targeted clarification questions before authoring polished resume prose.
- Do not include unresolved publication details in final prose.
- Maintain `work/claim-source-map.md` using the six-column claim map schema.

### Forbidden Behavior

- Invent institution, graduation timing, advisor, lab, publication venue, accepted status, or metrics.
- Present the under-review paper as accepted, published, or otherwise more certain than supplied.
- Produce final-looking bullets before blocking facts are resolved or explicitly omitted.
- Route core resume drafting decisions through unrelated content or design skills.

### Pass/Fail Checklist

- Transcript stops before polished authoring and asks targeted questions for blocking facts.
- `work/claim-source-map.md` exists and uses six columns.
- Final prose contains no unresolved or upgraded publication details.
- Omitted blocking facts are audited in notes or review output.
- Generated files are inside the scenario workspace, not package source paths.
