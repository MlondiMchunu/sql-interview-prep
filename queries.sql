-- Active: 1735564289448@@127.0.0.1@3306@restaurant
CREATE TABLE person(  
    person_id smallint unsigned,
    fname varchar(20),
    lname varchar(20),
    eye_color enum('br','bl','gr'),
    birth_date date,
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
);

create table favourite_food(
    person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key(person_id, food),
    constraint fk_fav_food_person_id foreign key(person_id) references person (person_id)
);   

alter table favourite_food rename favorite_food;

show tables;

/*modify primary key by adding auto increment*/
set foreign_key_checks = 1;
alter table person modify person_id smallint unsigned auto_increment;


/*Derived (subquery-generated) tables*/
select concat(cust.first_name,' , ',cust.last_name) full_name from (select first_name, last_name, email 
from customer
where first_name = 'JESSIE')cust;


use sakila;

/*temporary tables*/
create temporary table actors_j
(actor_id smallint(5),
first_name varchar(45),
last_name varchar(45));

select * from actor limit 5;

insert into actors_j
select actor_id, first_name, last_name
from actor where last_name like '%e%';

select * from actors_j;

/*views*/
create view cust_view as 
select customer_id, first_name, last_name, active
from customer;

select * from cust_view limit 10;

desc cust_view;

/*table links*/
select customer.first_name, customer.last_name, 
       time(rental.rental_date) rental_time
       from customer
          inner join rental
          on customer.customer_id = rental.customer_id
          where date(rental.rental_date) = '2005-06-14';

use sakila;

select * from rental limit 5;


show databases;

use sakila;
show tables;

use restaurant;
show tables;
desc person;
insert into person 