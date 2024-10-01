--1--
create database lab3;



--3--
select lastname
from employees;



--4--
select distinct lastname
from employees;



--5--
select *
from employees
where lastname='Smith';



--6--
select *
from employees
where lastname='Smith' or lastname='Doe';



--7--
select *
from employees
where department=14;



--8--
select *
from employees
where department=14 or department=77;



--9--
select sum(budget)
from departments;



--10--
select department, count(department)
from employees
group by department;



--11--
select department, count(department)
from employees
group by department
having count(department) > 2;



--12--
select *
from departments
order by budget desc
limit 1 offset 1;



--13--
select name, lastname
from employees
where department = (
    select code
    from departments
    order by budget
    limit 1);



--14--
select name
from employees
where city='Almaty'
union all
select name
from customers
where city='Almaty';



--15--
select *
from departments
where budget > 60000
order by budget, code desc;



--16--
update departments
set budget = budget * 0.9
where code = (
    select code from departments
    order by budget
    limit 1
    );



--17--
update departments
set name = 'IT'
where name = 'Research';



--18--
delete from employees
where department in (
    select code from departments
    where name = 'IT'
    );



--19--
delete from employees;