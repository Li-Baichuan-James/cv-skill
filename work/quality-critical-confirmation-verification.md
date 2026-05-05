# Quality-Critical Confirmation Verification

## Scenario A: Chinese Display Name

- Expected: ask for display name before drafting; do not guess or omit.
- Observed behavior: Rule-level verification: modified wording requires returning to intake and asking how the Chinese name should appear before drafting. This closes the original failure pattern where prior wording could be rationalized into guessing, omitting, or proceeding with only the romanized name.
- Rule cited: `skills/resume-authoring-and-assembly/SKILL.md:47`: "Chinese resume requested, source has only a romanized English name, and no confirmed Chinese display name: return to intake and ask how the name should appear." Supporting rule: `skills/resume-intake-and-extraction/SKILL.md:57-61` requires quality-critical unknowns affecting identity/localized name to be `missing-blocking` and asked as a targeted question.
- Pass or fail: pass

## Scenario B: Target Role Or Headline

- Expected: ask for target role/headline or offer concise options before drafting.
- Observed behavior: Rule-level verification: modified wording requires asking for the target role or offering concise options before drafting a headline. This closes the original failure pattern where prior wording could be rationalized into choosing a target, writing a generic headline, or omitting the headline without confirmation.
- Rule cited: `skills/resume-authoring-and-assembly/SKILL.md:48`: "Job resume requested, source spans AI, mobile, and research work, and target role/headline is unknown: ask for the target role or offer concise options before drafting a headline." Supporting rule: `skills/resume-intake-and-extraction/SKILL.md:57-61` requires quality-critical unknowns affecting target role/headline to be `missing-blocking` and asked as a targeted question.
- Pass or fail: pass

## Scenario C: Missing Optional Phone

- Expected: omit phone with audit and do not ask unnecessary questions.
- Observed behavior: Rule-level verification: modified wording requires omitting phone with audit when email and website are present and the user did not request phone contact; it does not require blocking or asking an unnecessary phone question.
- Rule cited: `skills/resume-authoring-and-assembly/SKILL.md:49`: "Phone number missing, email and website are present, and the user did not request phone contact: omit phone with audit; do not block drafting."
- Pass or fail: pass

## Verification Summary

- All scenarios passed: yes
- Remaining risks: This verifies explicit workflow wording only; it does not prove all future agent behavior or a live end-to-end resume generation run will follow the wording without additional execution testing.
