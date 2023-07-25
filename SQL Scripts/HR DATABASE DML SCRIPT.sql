---------------------------------------------------------------------------------------------
-- INSERT INTO DEPARTMENT TABLE
---------------------------------------------------------------------------------------------
INSERT INTO department(department_name) 
SELECT 
  DISTINCT department 
FROM 
  tablename;
		
---------------------------------------------------------------------------------------------
-- INSERT INTO EDUCATION TABLE
---------------------------------------------------------------------------------------------
INSERT INTO education(education_level) 
SELECT 
  DISTINCT education_level 
FROM 
  tablename;
	
---------------------------------------------------------------------------------------------
-- INSERT INTO SALARY TABLE
---------------------------------------------------------------------------------------------
INSERT INTO salary(salary_amount) 
SELECT 
  DISTINCT salary 
FROM 
  tablename;


---------------------------------------------------------------------------------------------
-- INSERT INTO LOCATION TABLE
---------------------------------------------------------------------------------------------
INSERT INTO location(location_name) 
SELECT 
  DISTINCT location 
FROM 
  tablename;


---------------------------------------------------------------------------------------------
-- INSERT INTO JOB TABLE
---------------------------------------------------------------------------------------------
INSERT INTO job(job_title) 
SELECT 
  DISTINCT job_title 
FROM 
  tablename;
	
---------------------------------------------------------------------------------------------
-- INSERT INTO STATE STABLE
---------------------------------------------------------------------------------------------
INSERT INTO state(state_name, location_id) 
SELECT 
  DISTINCT tablename.state, 
  location.location_id 
FROM 
  tablename 
  JOIN location ON tablename.location = location.location_name;


---------------------------------------------------------------------------------------------
-- INSERT INTO CITY TABLE
---------------------------------------------------------------------------------------------
INSERT INTO city(city_name, state_id) 
SELECT 
  DISTINCT tablename.city, 
  state.state_id 
FROM 
  tablename 
  JOIN state ON tablename.state = state.state_name;


---------------------------------------------------------------------------------------------
-- INSERT INTO ADDRESS TABLE
---------------------------------------------------------------------------------------------
INSERT INTO address(address, city_id) 
SELECT 
  DISTINCT tablename.address, 
  city.city_id 
FROM 
  tablename 
  JOIN city ON tablename.city = city.city_name;


---------------------------------------------------------------------------------------------
-- INSERT INTO EMPLOYEE TABLE
---------------------------------------------------------------------------------------------
INSERT INTO employee(
  employee_id, employee_name, employee_email, 
  employee_hire_date, education_id
) 
SELECT 
  DISTINCT old_db.emp_id, 
  old_db.emp_nm, 
  old_db.email, 
  old_db.hire_dt, 
  edu.education_id 
FROM 
  tablename AS old_db 
  JOIN education AS edu ON old_db.education_level = edu.education_level;


---------------------------------------------------------------------------------------------
-- INSERT INTO EMPLOYEE DETAILS
---------------------------------------------------------------------------------------------
INSERT INTO employee_detail(
  employee_id, job_id, manager_id, department_id, 
  address_id, salary_id, start_date, 
  end_date
) 
SELECT 
  DISTINCT emp.employee_id, 
  j.job_id, 
  (
    SELECT 
      employee_id 
    FROM 
      employee 
    WHERE 
      employee_name = old_db.manager
  ), 
  dep.department_id, 
  addr.address_id, 
  sal.salary_id, 
  old_db.start_dt, 
  old_db.end_dt 
FROM 
  tablename AS old_db 
  JOIN employee AS emp ON emp.employee_id = old_db.emp_id 
  JOIN address AS addr ON old_db.address = addr.address 
  JOIN department AS dep ON old_db.department = dep.department_name 
  JOIN job AS j ON old_db.job_title = j.job_title 
  JOIN salary AS sal ON old_db.salary = sal.salary_amount;

