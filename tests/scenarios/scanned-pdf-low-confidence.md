## Scenario: Scanned CV source with low-confidence extraction

User situation:
- The user provides a scanned PDF as the main source for resume content.
- OCR quality is poor, with uncertain names, dates, and section boundaries.
- The user expects a clean resume output but has not validated the extracted text.

Expected baseline failure without resume skills:
- A generic agent treats low-confidence OCR text as reliable input.
- It fabricates or normalizes unclear details instead of flagging uncertainty.
- It drafts a finished resume before asking for verification of ambiguous fields.
- It writes guessed resume content directly into `templates/` or `skills/` in this repo instead of keeping the uncertain extraction confined to `tests/` or a clearly marked scratch path.
- Its generated notes omit any runtime boundary and show the OCR-cleanup or drafting flow being handed off to unrelated skills during core resume generation.
