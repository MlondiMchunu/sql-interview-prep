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