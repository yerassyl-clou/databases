--1--
create database lab2;



--2--
create table countries (
    country_id serial primary key,
    country_name varchar(100),
    region_id integer,
    population integer
);



--3--
insert into countries (country_name, region_id, population) values ('Kazakhstan', 4, 20000000);



--4--
insert into countries (country_name) values ('China');



--5--
insert into countries (region_id) values (NULL);



--6--
insert into countries (country_name, region_id, population) values
    ('USA', 1, 200000000),
    ('Russia', 3, 100000000),
    ('India', 4, 1500000000);



--7--
alter table countries
alter column country_name set default 'Kazakhstan';



--8--
insert into countries (country_name) values (default);



--9--
insert into countries values (default);



--10-
create table countries_new (
    like countries
);



--11--
insert into countries_new
    select * from countries;



--12--
update countries_new set region_id = 1
where region_id is NuLL;



--13--
update countries_new set population = population * 1.1
returning country_name as "New Population";



--14--
delete from countries
where population < 100000;



--15--
delete from countries_new cn
    using countries c
    where c.country_id = cn.country_id
    returning *;



--16--
delete from countries
returning *;