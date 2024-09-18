--1--
create database lab1;


--2--
create table users (
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);


--3--
alter table users
add column isAdmin int;


--4--
alter table users
alter column isAdmin set data type boolean USING isadmin::boolean;


--5--
alter table users
alter column isAdmin set default false;


--6--
alter table users
add PRIMARY KEY (id);


--7--
create table tasks (
    id serial,
    name varchar(50),
    user_id int
    );


--8--
drop table tasks;


--9--
drop database lab1