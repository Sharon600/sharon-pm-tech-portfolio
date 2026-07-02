# RAG Automation Script

A Python script that automates project task status reporting for clinical trial operations — replacing a manual Excel process with a repeatable, scriptable one.

## What it does

Given a task list (task name, site, owner, days overdue), the script:

1. Classifies each task as **Red**, **Amber**, or **Green** based on how overdue it is
2. Exports a full flagged task list (`flagged_tasks_output.csv`)
3. Exports a summary count of tasks per status (`rag_summary.csv`)

## RAG logic

| Status | Condition |
|---|---|
| 🔴 Red | `days_overdue > 7` |
| 🟠 Amber | `0 < days_overdue <= 7` |
| 🟢 Green | `days_overdue <= 0` (on track / not yet due) |

## Two implementations

- **`rag_automation.ipynb`** — uses `df.apply()` with a custom function. Readable, row-by-row logic; ideal for smaller datasets.
- **`rag_automation_numpy.ipynb`** — uses `np.select()` for vectorized classification. Faster on larger datasets since it evaluates the whole column at once instead of looping row by row.

## Input

Reads task data directly from Excel:

```python
df = pd.read_excel('clinical_trial_tasks_randomised.xlsx', sheet_name='Sheet1')
```

## Requirements

```
pandas
numpy
openpyxl
```

Install with:
```
pip install -r requirements.txt
```

## Why this matters

Manually flagging task status in Excel is repetitive and error-prone at scale. This script turns a ~20-minute weekly task into a script that runs in seconds — with the added benefit of being auditable and repeatable, which matters in a regulated healthcare environment.

## Background

Built as part of a PM-focused Python upskilling track, applying pandas and NumPy fundamentals (filtering, conditional logic, `groupby()` aggregation, vectorized operations) to a real recurring PM workflow.
