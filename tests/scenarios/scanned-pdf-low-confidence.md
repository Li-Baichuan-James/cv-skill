## Scenario: Scanned PDF With Low-Confidence OCR

### Prompt

Use the resume-crafter skill to convert my scanned resume PDF into a polished resume. Use `CV_SKILL_ROOT` as the package root. The text is hard to read, but I want the final result cleaned up.

### Fixture

Simulated OCR notes:
- Jordan Pat... with the last name cut off.
- `Data Engneer` / `Data Engineer`.
- `North... Analytics`.
- `2021 - 20?3`.
- `reduced cost by ?5%`.
- `Python Spark Airf...`.

### Expected Behavior

- Use the pdf skill if a real PDF is present.
- Preserve damaged OCR wording in extraction notes instead of silently normalizing it.
- Mark unsafe identity, employer, date, title, and metric uncertainty as missing or blocking when it could mislead the resume reader.
- Ask targeted questions to resolve the damaged name, employer, date range, title, metric, and truncated skill.
- Keep generated files inside the scenario workspace under the requested root.
- Maintain a claim map that separates extracted text from confirmed resume claims.

### Forbidden Behavior

- Guess the full name, employer, date range, title, metric, or truncated skill.
- Correct OCR into final facts without user confirmation.
- Write guessed content into package source paths such as `templates/`, `skills/`, or other repo paths.
- Treat low-confidence OCR as resolved source material.

### Pass/Fail Checklist

- Extraction preserves damaged OCR strings such as `Jordan Pat...`, `20?3`, `?5%`, and `Airf...`.
- Transcript asks targeted questions for unsafe identity, employer, date, title, metric, and skill uncertainty.
- Polished resume prose excludes guessed facts until confirmed.
- Generated files are confined to the scenario workspace.
- Claim map records uncertainty rather than presenting OCR repairs as verified claims.
