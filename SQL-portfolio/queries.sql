-- ==========================================================
-- SQL PORTFOLIO QUERIES
-- Clinical Trial Project Management Reporting
-- ==========================================================

-- 1. Summarize patient enrollment by site to identify recruitment performance using RAG status.
-- ## Explanation: This query shows enrollment volumes per site with a traffic-light RAG status for quick prioritization.

SELECT
    ts.site_name,
    COUNT(pe.patient_id) AS enrolled_patients,
    CASE
        WHEN COUNT(pe.patient_id) >= 8 THEN 'Green'
        WHEN COUNT(pe.patient_id) >= 4 THEN 'Amber'
        ELSE 'Red'
    END AS rag_status
FROM trial_sites ts
LEFT JOIN patient_enrollment pe
    ON ts.site_id = pe.site_id
GROUP BY ts.site_id, ts.site_name
ORDER BY enrolled_patients DESC;


-- 2. Identify sites recruiting above the overall study average to recognize high-performing locations.
-- ## Explanation: This query compares each site's enrolled patients to the study average and highlights top performers.

SELECT
    ts.site_name,
    COUNT(pe.patient_id) AS enrolled_patients_above_avg
FROM trial_sites ts
LEFT JOIN patient_enrollment pe
    ON ts.site_id = pe.site_id
GROUP BY ts.site_id, ts.site_name
HAVING COUNT(pe.patient_id) >
(
    SELECT AVG(site_total)
    FROM
    (
        SELECT COUNT(*) AS site_total
        FROM patient_enrollment
        GROUP BY site_id
    ) avg_enrollment
);


-- 3. Find activated sites that have not enrolled a single patient to prioritize follow-up actions.
-- ## Explanation: This query identifies activated sites with no patient enrollment, so PMs know where recruitment support is needed.

SELECT
    ts.site_name,
    ts.country,
    ts.activation_date
FROM trial_sites ts
LEFT JOIN patient_enrollment pe
    ON ts.site_id = pe.site_id
WHERE ts.activation_date IS NOT NULL
    AND pe.patient_id IS NULL;


-- 4. Compare planned and actual milestone dates to highlight schedule slippage across sites.
-- ## Explanation: Milestone status helps surface delayed or pending site activities.

SELECT
    ts.site_name,
    m.milestone_name,
    m.target_date,
    m.actual_date,
    CASE
        WHEN m.actual_date IS NULL THEN 'Pending'
        WHEN m.actual_date > m.target_date THEN 'Delayed'
        ELSE 'On Time'
    END AS milestone_status
FROM milestones m
INNER JOIN trial_sites ts
    ON m.site_id = ts.site_id
ORDER BY ts.site_name;


-- 5. Compare planned versus actual spend by site to identify budget variance.
-- ## Explanation: This query shows budget variance by site to highlight overspend and underspend trends.

SELECT
    ts.site_name,
    bt.month,
    bt.planned_cost,
    bt.actual_cost,
    (bt.actual_cost - bt.planned_cost) AS budget_variance
FROM budget_tracking bt
INNER JOIN trial_sites ts
    ON bt.site_id = ts.site_id
ORDER BY budget_variance DESC;


-- 6. Categorize overdue tasks into aging buckets to focus project management attention.
-- ## Explanation: Task aging buckets show whether work is completed, overdue, or still on track in SQLite-compatible form.

SELECT
    task_name,
    owner,
    due_date,
    CASE
        WHEN completed_date IS NOT NULL THEN 'Completed'
        WHEN CAST(julianday('now') - julianday(due_date) AS INTEGER) > 30 THEN 'Overdue >30 Days'
        WHEN CAST(julianday('now') - julianday(due_date) AS INTEGER) > 14 THEN 'Overdue 15-30 Days'
        WHEN CAST(julianday('now') - julianday(due_date) AS INTEGER) > 7 THEN 'Overdue 8-14 Days'
        WHEN date('now') > due_date THEN 'Overdue <7 Days'
        ELSE 'On Track'
    END AS task_status
FROM project_tasks
ORDER BY due_date;


-- 7. Rank sites by enrollment velocity to understand which activated sites are recruiting fastest.
-- ## Explanation: Enrollment velocity uses days since activation to identify the fastest-recruiting sites.

SELECT
    ts.site_name,
    COUNT(pe.patient_id) AS enrolled_patients,
    ROUND(
        COUNT(pe.patient_id) /
        NULLIF(CAST(julianday('now') - julianday(ts.activation_date) AS INTEGER), 0),
        2
    ) AS enrollment_velocity
FROM trial_sites ts
LEFT JOIN patient_enrollment pe
    ON ts.site_id = pe.site_id
WHERE ts.activation_date IS NOT NULL
GROUP BY ts.site_id, ts.site_name, ts.activation_date
ORDER BY enrollment_velocity DESC
LIMIT 3;


-- 8. Summarize active study footprint by country to support regional portfolio planning.
-- ## Explanation: Country-level active site counts support regional planning and resourcing decisions.

SELECT
    country,
    COUNT(*) AS active_sites
FROM trial_sites
WHERE status = 'Active'
GROUP BY country
HAVING COUNT(*) > 2
ORDER BY active_sites DESC;


-- 9. Identify patients enrolled at sites where no project tasks have been completed.

SELECT
    patient_id,
    site_id,
    enrollment_date
FROM patient_enrollment
WHERE site_id NOT IN
(
    SELECT DISTINCT site_id
    FROM project_tasks
    WHERE completed_date IS NOT NULL
)
ORDER BY enrollment_date;


-- 10. Build a single operational dashboard combining enrollment, milestones, budget performance, and overall RAG status.
-- ## Explanation: This summary gives PMs a consolidated view of site health across enrollment, milestone progress, and budget.

SELECT
    ts.site_name,
    COUNT(DISTINCT pe.patient_id) AS enrolled_patients,
    MAX(m.status) AS latest_milestone_status,
    SUM(bt.actual_cost - bt.planned_cost) AS total_budget_variance,
    CASE
        WHEN COUNT(DISTINCT pe.patient_id) >= 5
             AND SUM(bt.actual_cost - bt.planned_cost) <= 0
             THEN 'Green'
        WHEN COUNT(DISTINCT pe.patient_id) >= 2
             THEN 'Amber'
        ELSE 'Red'
    END AS overall_rag_status
FROM trial_sites ts
LEFT JOIN patient_enrollment pe
    ON ts.site_id = pe.site_id
LEFT JOIN milestones m
    ON ts.site_id = m.site_id
LEFT JOIN budget_tracking bt
    ON ts.site_id = bt.site_id
GROUP BY ts.site_id, ts.site_name
ORDER BY overall_rag_status, enrolled_patients DESC;