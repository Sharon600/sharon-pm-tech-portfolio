-- ============================================
-- SAMPLE DATA - CLINICAL TRIAL PM DATABASE
-- ============================================

-- ============================================
-- trial_sites
-- ============================================

INSERT INTO trial_sites (site_id, site_name, country, status, activation_date) VALUES
(101, 'Chennai Medical Center', 'India', 'Active', '2024-01-15'),
(102, 'Apollo Research Unit', 'India', 'Active', '2024-02-10'),
(103, 'Bangalore Clinical Institute', 'India', 'Pending', NULL),
(104, 'Mumbai Health Sciences', 'India', 'Active', '2023-11-20'),
(105, 'Delhi Research Hospital', 'India', 'Closed', '2023-09-18'),
(106, 'Singapore General Hospital', 'Singapore', 'Active', '2024-01-30'),
(107, 'National University Hospital', 'Singapore', 'Active', '2024-03-05'),
(108, 'Bangkok Clinical Center', 'Thailand', 'Pending', NULL),
(109, 'Seoul Medical Research', 'South Korea', 'Active', '2024-02-22'),
(110, 'Tokyo University Hospital', 'Japan', 'Active', '2023-12-12'),
(111, 'Sydney Clinical Research', 'Australia', 'Closed', '2023-08-05'),
(112, 'Melbourne Medical Centre', 'Australia', 'Active', '2024-04-01'),
(113, 'London Trial Institute', 'United Kingdom', 'Active', '2024-01-08'),
(114, 'Berlin Research Clinic', 'Germany', 'Pending', NULL),
(115, 'Toronto Health Network', 'Canada', 'Active', '2024-02-28'),
(116, 'New York Medical Center', 'United States', 'Active', '2023-10-15'),
(117, 'Boston Clinical Institute', 'United States', 'Closed', '2023-07-20'),
(118, 'São Paulo Research Hospital', 'Brazil', 'Pending', NULL);

-- ============================================
-- patient_enrollment
-- ============================================

INSERT INTO patient_enrollment (patient_id, site_id, enrollment_date, status, withdrawal_date) VALUES
(1001,101,'2024-02-01','Active',NULL),
(1002,101,'2024-02-10','Completed',NULL),
(1003,102,'2024-03-01','Withdrawn','2024-04-18'),
(1004,102,'2024-03-12','Active',NULL),
(1005,104,'2024-01-08','Completed',NULL),
(1006,104,'2024-01-15','Active',NULL),
(1007,106,'2024-02-20','Withdrawn','2024-03-28'),
(1008,106,'2024-03-05','Completed',NULL),
(1009,107,'2024-03-15','Active',NULL),
(1010,109,'2024-03-20','Screen Failure',NULL),
(1011,110,'2024-01-18','Completed',NULL),
(1012,112,'2024-04-08','Active',NULL),
(1013,113,'2024-02-05','Completed',NULL),
(1014,115,'2024-03-10','Active',NULL),
(1015,116,'2024-01-22','Withdrawn','2024-02-19'),
(1016,116,'2024-02-02','Completed',NULL),
(1017,117,'2023-08-10','Completed',NULL),
(1018,105,'2023-10-02','Completed',NULL);

-- ============================================
-- project_tasks
-- ============================================

INSERT INTO project_tasks (task_id, site_id, task_name, due_date, completed_date, owner) VALUES
(201,101,'Site Initiation Visit','2024-01-10','2024-01-09','Anita Rao'),
(202,101,'Regulatory Document Review','2024-02-20','2024-02-25','Rahul Menon'),
(203,102,'Contract Execution','2024-02-15','2024-02-14','Priya Shah'),
(204,103,'Ethics Committee Approval','2024-03-15',NULL,'Kevin Lee'),
(205,104,'Pharmacy Setup','2023-12-01','2023-11-28','David Wilson'),
(206,106,'First Patient In','2024-03-10','2024-03-12','Sarah Lim'),
(207,107,'Site Staff Training','2024-03-20','2024-03-18','Grace Tan'),
(208,108,'Budget Approval','2024-04-05',NULL,'Somchai Arun'),
(209,109,'Source Document Verification','2024-04-01',NULL,'Ji-hoon Kim'),
(210,110,'Monitoring Visit','2024-02-28','2024-03-02','Yuki Sato'),
(211,112,'Database Lock Preparation','2024-05-10',NULL,'Emma Brown'),
(212,113,'Patient Recruitment Plan','2024-02-01','2024-01-30','Oliver Smith'),
(213,114,'Site Qualification Visit','2024-04-15',NULL,'Lukas Weber'),
(214,115,'Lab Equipment Validation','2024-03-25','2024-03-24','Sophia Chen'),
(215,116,'Protocol Training','2023-11-01','2023-10-31','Michael Johnson'),
(216,118,'Investigator Meeting','2024-05-01',NULL,'Carlos Silva'),
(217,102,'Close Query Log','2024-04-12',NULL,'Priya Shah'),
(218,106,'Final Monitoring Report','2024-04-30','2024-05-03','Sarah Lim');

-- ============================================
-- milestones
-- ============================================

INSERT INTO milestones (milestone_id, site_id, milestone_name, target_date, actual_date, status) VALUES
(301,101,'Site Activated','2024-01-15','2024-01-15','Completed'),
(302,102,'First Patient In','2024-03-01','2024-03-01','Completed'),
(303,103,'Site Activated','2024-03-20',NULL,'Pending'),
(304,104,'Last Patient In','2024-05-30',NULL,'In Progress'),
(305,105,'Database Lock','2024-02-28','2024-03-05','Completed'),
(306,106,'First Patient In','2024-03-15','2024-03-18','Completed'),
(307,107,'Site Activated','2024-03-05','2024-03-05','Completed'),
(308,108,'Site Activated','2024-04-10',NULL,'Pending'),
(309,109,'Interim Analysis','2024-05-15',NULL,'In Progress'),
(310,110,'First Patient In','2024-02-01','2024-01-29','Completed'),
(311,112,'Monitoring Complete','2024-06-01',NULL,'Pending'),
(312,113,'Site Activated','2024-01-08','2024-01-08','Completed'),
(313,114,'Contract Signed','2024-04-20',NULL,'Delayed'),
(314,115,'First Patient In','2024-03-15','2024-03-14','Completed'),
(315,116,'Database Lock','2024-06-10',NULL,'In Progress'),
(316,117,'Study Close-Out','2024-01-15','2024-01-20','Completed'),
(317,118,'Site Initiation','2024-05-10',NULL,'Pending'),
(318,106,'Last Patient In','2024-06-20',NULL,'In Progress');

-- ============================================
-- budget_tracking
-- ============================================

INSERT INTO budget_tracking (site_id, month, planned_cost, actual_cost) VALUES
(101,'2024-01-01',25000.00,24500.00),
(101,'2024-02-01',18000.00,19250.00),
(102,'2024-02-01',22000.00,21500.00),
(102,'2024-03-01',24000.00,26000.00),
(104,'2024-01-01',27000.00,26500.00),
(106,'2024-02-01',30000.00,31000.00),
(106,'2024-03-01',28000.00,27600.00),
(107,'2024-03-01',21000.00,20850.00),
(109,'2024-03-01',26000.00,27200.00),
(110,'2024-01-01',32000.00,31500.00),
(112,'2024-04-01',23000.00,22800.00),
(113,'2024-02-01',25500.00,24800.00),
(115,'2024-03-01',24000.00,25100.00),
(116,'2024-01-01',35000.00,36800.00),
(117,'2023-08-01',20000.00,19800.00),
(105,'2023-10-01',18000.00,17500.00),
(118,'2024-05-01',22000.00,NULL),
(114,'2024-04-01',21000.00,NULL);