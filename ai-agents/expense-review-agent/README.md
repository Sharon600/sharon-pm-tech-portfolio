## PM Brief — Expense Review Agent (Copilot Studio)

**Feature name:** Expense Review Agent (Copilot Studio Agent)

**Problem it solves:**

IQVIA processes roughly 500 to 600 expense line items per study, per month, across billing worksheets. These include third-party vendor supply invoices, investigator payment request invoices, and internally generated invoices (site visit travel payments, internal cost pass-through). Every expense has to be manually cross-checked against the study-level database and company SharePoint records before a PM or Financial Analyst can approve it for sponsor billing. At this volume, manual review across multiple systems is slow and error-prone.

**Who it's for:**

Project Managers and Financial Analysts who review and approve expenses before sponsor invoicing.

**How it works (high level):**

Built as a Copilot Studio agent with **Company knowledge** access — SharePoint sources internal to IQVIA (not externally accessible), including the study-level expense database, voucher and supply records, and site documentation.

The agent was built and tested in the **Unmanaged (Dev/Sandbox) environment** first, where topics, flows, and knowledge sources could be configured and tested without production governance restrictions. Once validated, it was **published to the Managed (Production) environment**, which enforces enterprise governance, data policies, and licensing controls appropriate for a regulated workflow.

Inside the agent:

- **Topics** are built for each individual conversation path — for example, a trigger like "verify this expense category code" or "check cost conversion for this line item" opens a topic with its own branches for follow-up questions.
- **Flows** combine two or more topics together, so the agent can, for instance, both look up the historical voucher and cross-check the category code mapping in the same conversation without the user needing to ask separately.
- Generative AI is used to route each incoming question to the correct topic or flow based on intent, and to apply compliance rules while generating review comments.

For each new expense, the agent:

- Cross-checks the expense against historical vouchers, supply records, and site data in the study database
- Verifies category code mapping is correct
- Verifies cost conversion is correctly applied
- Flags anything that deviates from compliance rules
- Returns a review summary with comments for the PM or Financial Analyst to verify and approve before the expense moves to sponsor billing

The agent doesn't auto-approve. It surfaces a structured first-pass review so the human reviewer only spends time on flagged exceptions, not every line item.

**How success is measured:**

- Compliance: reduction in category code / cost conversion errors reaching sponsor invoicing
- Turnaround time: reduction in average review time per monthly billing worksheet cycle (500–600 lines)

**Compliance considerations:**

- Agent knowledge scope is limited to Company (SharePoint) sources internal to IQVIA — no external data access
- Built and tested in an Unmanaged Dev environment before being published to the Managed Production environment, so governance and licensing controls apply before go-live
- All expense approvals remain human-reviewed; agent output is advisory only, not decisioning
- Topic and flow logic is configurable and traceable within Copilot Studio, so compliance rule changes can be tracked
- Audit trail preserved for TMF/audit readiness: agent-flagged comments are retained alongside final human approval