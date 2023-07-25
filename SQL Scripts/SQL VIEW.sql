----------------------------------------------------------------------------
-- CREATING SQL VIEW
----------------------------------------------------------------------------
CREATE VIEW employee_view AS
SELECT e.employee_id, 
    e.employee_name, 
	   e.employee_email, 
	   e.employee_hire_date,
     edu.education_level, 
	   d.department_name, 
	   j.job_title, 
	   loc.location_name, 
	   s.salary_amount, 
	   c.city_name, 
	   st.state_name, 
	   a.address
FROM employee_detail ed
JOIN employee e 
	ON ed.employee_id = e.employee_id
JOIN education edu 
	ON e.education_id = edu.education_id
JOIN department d 
	ON ed.department_id = d.department_id
JOIN job j
	ON ed.job_id = j.job_id
JOIN salary s 
	ON ed.salary_id = s.salary_id
JOIN address a 
	ON ed.address_id = a.address_id
JOIN city c 
	ON a.city_id = c.city_id
JOIN state st 
	ON c.state_id = st.state_id
JOIN location loc 
	ON st.location_id = loc.location_id;
	
SELECT * FROM employee_view;

	

