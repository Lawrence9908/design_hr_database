---------------------------------------------------------------------------------------------
-- CREATING DEPARTMENT TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "department"(
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(50),
	CONSTRAINT department_name_length 
		CHECK(LENGTH(TRIM(department_name))>0)
);

---------------------------------------------------------------------------------------------
-- CREATING EDUCATION TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "education"(
	education_id SERIAL PRIMARY KEY,
	education_level VARCHAR(60),
	CONSTRAINT eductaion_level_length
		CHECK(LENGTH(TRIM(education_level))>0)
);
---------------------------------------------------------------------------------------------
-- CREATING SALARY TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "salary"(
	salary_id SERIAL PRIMARY KEY,
	salary_amount NUMERIC NOT NULL,
	CONSTRAINT salary_not_negative
		CHECK(salary_amount>0.0)
);

---------------------------------------------------------------------------------------------
-- CREATING LOCATION TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE  "location"(
	location_id SERIAL PRIMARY KEY,
	location_name VARCHAR(80) NOT NULL,
	CONSTRAINT location_name_length
		CHECK(LENGTH(TRIM(location_name))>0)
);
---------------------------------------------------------------------------------------------
-- CREATING JOB TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "job"(
	job_id SERIAL PRIMARY KEY,
	job_title VARCHAR(60) NOT NULL,
	CONSTRAINT job_title_length 
		CHECK(LENGTH(TRIM(job_title))>0)
);
---------------------------------------------------------------------------------------------
-- CREATING STATE STABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "state"(
	state_id SERIAL PRIMARY KEY,
	state_name VARCHAR(50) NOT NULL,
	location_id INT,
	CONSTRAINT state_name_length
		CHECK(Length(Trim(state_name))>0),
	CONSTRAINT location_id 
		FOREIGN KEY(location_id) 
			REFERENCES location(location_id)
);
---------------------------------------------------------------------------------------------
-- CREATING CITY TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE  "city"(
	city_id SERIAL PRIMARY KEY,
	city_name VARCHAR(70) NOT NULL,
	state_id INT,
	CONSTRAINT city_name_length 
		CHECK(Length(Trim(city_name))>0),
	CONSTRAINT state_id 
		FOREIGN KEY (state_id) 
			REFERENCES state(state_id) 
);


---------------------------------------------------------------------------------------------
-- CREATING ADDRESS TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "address"(
	address_id SERIAL PRIMARY KEY,
	address VARCHAR(120),
	city_id INT,
	CONSTRAINT address_length 
		CHECK(Length(Trim(address))>0),
	CONSTRAINT city_id 
		FOREIGN KEY(city_id) 
			REFERENCES city(city_id)
);


---------------------------------------------------------------------------------------------
-- CREATING EMPLOYEE TABLE
---------------------------------------------------------------------------------------------
CREATE TABLE "employee"(
  employee_id VARCHAR(20) PRIMARY KEY,
  employee_name VARCHAR(100) NOT NULL,
  employee_email VARCHAR(100) NOT NULL,
  employee_hire_date VARCHAR(30),
  education_id INT,
  CONSTRAINT education_id
		FOREIGN KEY(education_id) 
			REFERENCES education(education_id)
);
---------------------------------------------------------------------------------------------
-- EMPLOYEE DETAILS

-- There is many to many relation ship between employee and job
-- One employee can work more than one job and one job can be worked by multiple emplpoyees
----------------------------------------------------------------------------------------------
CREATE TABLE employee_detail(
	employee_id VARCHAR(30),
	job_id INT,
	manager_id VARCHAR(20),
	start_date VARCHAR(10),
	end_date VARCHAR(10),
	department_id INT,
	address_id INT,
	salary_id INT,
	CONSTRAINT employee_id 
		FOREIGN KEY (employee_id) 
			REFERENCES employee(employee_id),
	CONSTRAINT manager_id 
		FOREIGN KEY (employee_id) 
			REFERENCES employee(employee_id),
	CONSTRAINT job_id 
		FOREIGN KEY(job_id) 
			REFERENCES job(job_id),
	CONSTRAINT department_id 
		FOREIGN KEY(department_id) 
			REFERENCES department(department_id),
	CONSTRAINT address_id 
		FOREIGN KEY(address_id) 
			REFERENCES address(address_id),
	CONSTRAINT salary_id 
		FOREIGN KEY(salary_id)
			REFERENCES salary(salary_id),
	PRIMARY KEY(employee_id, job_id)
);






