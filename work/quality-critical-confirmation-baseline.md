# Quality-Critical Confirmation Baseline

## Scenario A: Chinese Display Name

- Prompt summary: English CV contains only `LI Baichuan`; user requests Chinese job resume.
- Observed behavior: Wording-based baseline assessment, not an execution transcript: current rules may support asking because the missing Chinese display name touches identity and language/template fit, but they do not clearly require it. The wording does not explicitly prevent guessing a localized name or omitting it; omission is unsafe here because the user requested a Chinese resume and the display name is visible header content.
- Rule cited: `resume-intake-and-extraction` Stop Conditions: "If key chronology, identity, publication, title, or impact facts are missing, stop and ask targeted questions before drafting." `resume-crafter` High-Risk Uncertainty: "identity, contact, degree, school, employer, title, date, location, or chronology ambiguity" and "ATS/photo tradeoffs, language/template mismatch, or any choice that could make the resume misleading" are high-risk until resolved, omitted, or explicitly accepted.
- Failure pattern: The current workflow can rationalize that `LI Baichuan` is a resolved source-backed identity while the absent Chinese display name is merely an optional localization choice, allowing either English-only display, guessed localization, or silent omission instead of requiring user confirmation for the Chinese resume header.

## Scenario B: Target Role Or Headline

- Prompt summary: CV has mixed AI/mobile/research projects; user asks for job resume without target role.
- Observed behavior: Wording-based baseline assessment, not an execution transcript: current wording should identify the target context and ask targeted questions for high-risk audience or template mismatch, but it does not explicitly require asking for the target job or role. The target job/role is quality-critical because it determines resume positioning; headline wording is derived from that target and should not be invented from mixed AI, mobile, and research projects.
- Rule cited: `resume-crafter` Workflow: "Identify whether the target is industry, research-oriented, Chinese standard, or photo/visual" and "Ask only targeted questions needed to resolve `missing-blocking` or high-risk uncertainty." `resume-crafter` High-Risk Uncertainty includes "ATS/photo tradeoffs, language/template mismatch, or any choice that could make the resume misleading." `resume-authoring-and-assembly` Authoring Rules: "Industry resumes prioritize impact, delivery, stack clarity, and ATS readability" and "Research resumes prioritize education, research, selected publications, selected projects, and scholarly traceability."
- Failure pattern: Because target job/role is not named as a blocking unknown, an agent can rationalize template/audience selection from available projects, choose an AI/mobile/research emphasis, or produce a generic headline without confirming the user's intended job target.

## Scenario C: Missing Optional Phone

- Prompt summary: CV has email and website but no phone; user did not request phone.
- Observed behavior: Wording-based baseline assessment, not an execution transcript: missing phone should not block drafting when the user did not request it and other contact details exist. Current rules already handle missing optional phone adequately by supporting omission from final prose and traceable working notes rather than inventing a fake value or stopping for confirmation.
- Rule cited: `resume-crafter` Uncertainty States: "`omitted-unresolved`: records an intentional omission and must not appear in final prose." `resume-authoring-and-assembly` Authoring Rules: "Do not invent achievements, metrics, dates, titles, venues, publication status, advisor names, or ownership details" and "If a detail is `needs-confirmation`, do not smooth it into final resume prose. Keep it out of the final bullet, or replace it with wording that stays strictly within `resolved` facts, and preserve the unresolved item in working notes." `resume-review-and-delivery` Review Checklist: "links and contact information appear intentional."
- Failure pattern: Current rules already handle this scenario adequately; no skill edit is needed for phone handling except preserving missing optional phone as a non-blocking example. Asking for a phone number would be unnecessary friction, blocking would be too strict, and inventing a phone would violate the no-invention/source-backed rules.

## Baseline Summary

- Rationalization 1: Scenario-specific risk, not a complete baseline assessment of the resume skills: generic identity and language/template rules can be interpreted narrowly, so an agent may treat the romanized name as enough for identity and avoid asking for a Chinese display name.
- Rationalization 2: Scenario-specific risk, not a complete baseline assessment of the resume skills: generic audience/template rules do not explicitly elevate target job/role to `missing-blocking`, so an agent may infer positioning from mixed projects instead of confirming the user's job target; any headline text should be derived only after that target is resolved.
- Confirmed acceptable existing behavior: Missing optional phone does not block drafting when not requested; the safe baseline behavior is to omit it with working-note/audit traceability and use only resolved email and website contact facts.
