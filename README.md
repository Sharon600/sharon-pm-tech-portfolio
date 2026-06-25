# sharon-pm-tech-portfolio
# Sharon Jemimah, PMP | PM Tech Portfolio

**Project Manager | Healthcare & Clinical Trials | AI, Automation & Data Analytics**

[LinkedIn](https://linkedin.com/in/your-profile) • [Email](mailto:jemimahsharon97@gmail.com) • Chennai, India

---

## About This Repository

I am a PMP-certified Project Manager with 7+ years delivering enterprise programs in clinical research and regulated healthcare environments. This portfolio demonstrates my working-level technical skills in SQL, Python, and AI-powered automation — built to complement my PM practice, not replace it.

Everything here is applied directly to real PM problems: project tracking, site performance analysis, stakeholder reporting, and workflow automation.

---

## What Is in This Repo

| Project | Skills | Status |
|---|---|---|
| [SQL Portfolio](#1-sql-portfolio) | SQL (SELECT, JOIN, GROUP BY, CASE) | In Progress |
| [Python Automation Script](#2-python-automation-script) | Python, pandas, RAG logic | In Progress |
| [AI Reporting Workflow](#3-ai-reporting-workflow) | Power Automate, Microsoft Copilot | In Progress |

---

## 1. SQL Portfolio

**Folder:** `/sql-portfolio`

Clinical trial site performance analysis written in SQL. Designed to answer the kind of questions a PM asks every week: which sites are underperforming, where are enrollment bottlenecks, what is the average activation time by country.

**Concepts covered:**

- SELECT, WHERE, ORDER BY
- GROUP BY with COUNT, AVG, SUM
- INNER JOIN and LEFT JOIN across sites and enrollment tables
- Subqueries for above-average filtering
- CASE statements for RAG status classification (Red / Amber / Green)
- HAVING to filter aggregated results

**Sample query: RAG status by site**

```sql
SELECT
  site_name,
  enrolled_count,
  CASE
    WHEN enrolled_count >= 20 THEN 'Green'
    WHEN enrolled_count >= 10 THEN 'Amber'
    ELSE 'Red'
  END AS rag_status
FROM site_summary
ORDER BY enrolled_count DESC;
```

**PM relevance:** This is the same analysis I previously did manually in Excel pivot tables. SQL makes it repeatable, auditable, and shareable with data and engineering teams.

---

## 2. Python Automation Script

**Folder:** `/python-automation`

A Python script that reads a project task list exported from Excel or Smartsheet, applies RAG classification logic, and outputs two files: a detailed flagged task list and an executive summary.

**What it does:**

- Loads a CSV of project tasks with due dates and completion status
- Calculates days overdue per task
- Applies conditional RAG logic (Red if overdue more than 7 days, Amber if overdue 1 to 7 days, Green if on track)
- Exports a flagged full task list and a summary count by status

**Core logic:**

```python
import pandas as pd

df = pd.read_csv('project_tasks.csv')

def rag_status(row):
    if row['days_overdue'] > 7:
        return 'Red'
    elif row['days_overdue'] > 0:
        return 'Amber'
    else:
        return 'Green'

df['rag'] = df.apply(rag_status, axis=1)

summary = df.groupby('rag')['task_name'].count().reset_index()
summary.columns = ['Status', 'Task Count']

df.to_csv('flagged_tasks_output.csv', index=False)
summary.to_csv('rag_summary.csv', index=False)
```

**PM relevance:** What previously took 20 minutes of manual Excel filtering now runs in seconds. The output is stakeholder-ready and consistent across every reporting cycle.

---

## 3. AI Reporting Workflow

**Folder:** `/ai-workflow`

End-to-end automation of weekly PM status reporting using Microsoft Copilot and Power Automate. This workflow replaced a manual multi-step process with a triggered pipeline that goes from raw data to formatted stakeholder output.

**Workflow steps:**

1. Trigger: new data file dropped into SharePoint folder
2. Power Automate pulls data and passes it to Copilot for summarization
3. Copilot applies a prompt template to generate a structured status update
4. Output is formatted and sent to the designated stakeholder distribution list

**Result:** Executive reporting turnaround reduced by approximately 40%. Presented as a scalable AI use case at a global IQVIA town hall.

**Documentation:** Workflow diagram, prompt templates, and setup notes included in the folder.

---

## How to Read This Portfolio

I am a PM, not a software engineer. The code here is production-grade for a PM context: readable, documented, and built to solve real delivery problems.

If you are a hiring manager, the right question to ask is not "how complex is the code" but "does this person understand where technology fits in a PM workflow and can they operate credibly with technical teams." The answer is yes.

If you are an engineer or technical interviewer, I am happy to walk through any script line by line and explain the logic, the trade-offs, and how it maps to the underlying SQL or pandas equivalent.

---

## Background

- PMP certified (PMI)
- 7+ years in healthcare PM, clinical trials, and regulated environments
- Currently at IQVIA, managing a USD 40M global portfolio
- Upskilling in SQL, Python, and AI product workflows applied to PM delivery

Full resume available on request or via LinkedIn.

---

*Last updated: June 2026*
