--1--
create database lab8;



--2--
create table salesman (
    salesman_id integer primary key,
    name varchar,
    city varchar,
    commission float
);

create table customers (
    customer_id integer primary key ,
    cust_name varchar,
    city varchar,
    grade integer,
    salesman_id integer references salesman
);

create table orders (
    ord_no integer,
    purch_amt float,
    ord_date date,
    customer_id integer references customers,
    salesman_id integer references salesman
);



--3--
create role junior_dev login;



--4--
create view salesmanInNewYork as
    select * from salesman where city = 'New York';



--5--
create or replace view salesmanAndCustomersView as
    select c.cust_name customerName, s.name salesmanName
    from salesman s join customers c on s.salesman_id = c.salesman_id;

grant all on salesmanAndCustomersView to junior_dev;



--6--
create view highestGradeCustomersView as
    select * from customers where grade = (
    select grade from customers
        order by grade desc nulls last
        limit 1);

grant select on highestGradeCustomersView to junior_dev;



--7--
create view numberOfSalesmanInCityView as
    select city, count(*)
    from salesman
    where city is not null
    group by city;



--8--
select * from salesman where salesman_id in (
    select salesman_id from customers
    group by salesman_id
    having count(*) > 1
    );

select s.salesman_id, s.name, s.city, s.commission
    from salesman s
        join customers c on s.salesman_id = c.salesman_id
    group by s.salesman_id, s.name
    having count(c.customer_id) > 1;



--9--
create role intern;
grant junior_dev to intern;