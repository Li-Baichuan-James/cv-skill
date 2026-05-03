## Scenario: Research resume with missing details

User situation:
- The user wants a concise research-oriented resume drafted from partial notes.
- Key facts are missing, such as publication venues, dates, advisor names, and contribution scope.
- The user has not confirmed whether unknown items should be left blank, marked for follow-up, or inferred from context.

Expected baseline failure without resume skills:
- A generic agent starts drafting too early instead of clarifying the missing facts.
- It over-interprets thin notes into polished claims that were never supplied.
- It fills gaps with guessed chronology or invented research details to make the document look complete.
- It outputs a finished-looking research resume section with confident bullets and no `[confirm]` markers, leaving the user unable to tell which claims are verified.
- Its notes or transcript show dependency drift, such as proposing unrelated skills to resolve missing academic facts instead of keeping the core resume decision flow bounded.
