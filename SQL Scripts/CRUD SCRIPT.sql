----------------------------------------------------------------------------
-- CRUD SCRIPT
----------------------------------------------------------------------------
-- Question 1
-- Return a list of employees with job Titles and Department Names

SELECT 
  e.employee_name, 
  j.job_title, 
  d.department_name 
FROM 
  employee e 
  JOIN employee_detail ed ON e.employee_id = ed.employee_id 
  JOIN job j ON ed.job_id = j.job_id 
  JOIN department d ON ed.department_id = d.department_id;


-- Question 2
-- Insert Web Programmer as a new job title

INSERT INTO job (job_title) 
VALUES 
  ('Web Programmer');
  
-- Question 3
-- Correst the job titlle from web Programmer to web developer

UPDATE job
SET job_title = 'Web Developer'
WHERE job_title = 'Web Programmer';

-- Question 4
-- Delete the job title WEb Developer from the database
DELETE FROM job
WHERE job_title = 'Web Developer';

-- Question 5
-- How many employees are in each deparment
SELECT 
  d.department_name, 
  COUNT(*) AS employee_count 
FROM 
  employee_detail ed 
  JOIN department d ON ed.department_id = d.department_id
  WHERE end_date is null
GROUP BY 
  d.department_name;
  
-- Question 6
-- Write a query that returns current and past jobs
-- (include employee anme, job title, department, manager anme, start and end dtae for poation) 
-- for mployeee Toni Lembeck.
SELECT 
  e.employee_name, 
  j.job_title, 
  d.department_name, 
  m.employee_name AS manager_name, 
  ed.start_date, 
  ed.end_date 
FROM 
  employee_detail ed 
  JOIN employee e ON ed.employee_id = e.employee_id 
  JOIN job j ON ed.job_id = j.job_id 
  JOIN department d ON ed.department_id = d.department_id 
  LEFT JOIN employee m ON ed.manager_id = m.employee_id 
WHERE 
  e.employee_name = 'Toni Lembeck';

