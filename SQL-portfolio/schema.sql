CREATE TABLE trial_sites (
    site_id INT PRIMARY KEY,
    site_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    status VARCHAR(30),
    activation_date DATE
);

CREATE TABLE patient_enrollment (
    patient_id INT PRIMARY KEY,
    site_id INT,
    enrollment_date DATE,
    status VARCHAR(30),
    withdrawal_date DATE,
    FOREIGN KEY (site_id) REFERENCES trial_sites(site_id)
);

CREATE TABLE project_tasks (
    task_id INT PRIMARY KEY,
    site_id INT,
    task_name VARCHAR(150) NOT NULL,
    due_date DATE,
    completed_date DATE,
    owner VARCHAR(100),
    FOREIGN KEY (site_id) REFERENCES trial_sites(site_id)
);

CREATE TABLE milestones (
    milestone_id INT PRIMARY KEY,
    site_id INT,
    milestone_name VARCHAR(150) NOT NULL,
    target_date DATE,
    actual_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (site_id) REFERENCES trial_sites(site_id)
);

CREATE TABLE budget_tracking (
    site_id INT,
    month DATE,
    planned_cost DECIMAL(12,2),
    actual_cost DECIMAL(12,2),
    PRIMARY KEY (site_id, month),
    FOREIGN KEY (site_id) REFERENCES trial_sites(site_id)
);