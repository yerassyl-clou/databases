--1--
create index countries_name_index on countries (name);


--2--
create index employees_full_name_index on employees (name, surname);


--3--
create unique index employees_salary_index on employees (salary) where salary < 2000 and salary > 500;


--4--
create index employees_name_substring_index on emplpyees (substr(name, 1, 4));


--5--
create index employees_department_id_index on employees (department_id, salary);
create index departments_department_id_index on departments (department_id, budget);
