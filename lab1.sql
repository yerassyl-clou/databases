create database lab1;



create table users (
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);



alter table users
add column isAdmin int;



alter table users
alter column isAdmin set data type boolean USING isadmin::boolean;



alter table users
alter column isAdmin set default false;



alter table users
add PRIMARY KEY (id);



create table tasks (
    id serial,
    name varchar(50),
    user_id int
    );



drop table tasks;



drop database lab1




