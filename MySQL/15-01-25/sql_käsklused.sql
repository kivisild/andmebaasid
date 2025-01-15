CREATE DATABASE bank;
USE bank;

CREATE TABLE customer (
	id BIGINT UNSIGNED auto_increment,
    idcode BIGINT UNSIGNED UNIQUE,
    firstname varchar(255),
    lastname varchar(255),
    country char(3) default "EST",
    gender enum ('M', 'N') default null,
    
    PRIMARY KEY(id)
);

INSERT INTO customer (idcode, firstname, lastname) VALUES(50204080291, "Kaarel", "Ploomipuu");

CREATE TABLE audit (
	id bigint unsigned auto_increment,
    tablename varchar (32),
    tableid bigint unsigned,
    operation char(3),
    user varchar(64),
    createdat datetime default current_timestamp,
    
    primary key (id)
);

delimiter $$
CREATE TRIGGER after_customer_insert
after insert on customer
for each row
begin
	insert into audit (tablename, tableid, operation, user)
		values ("CUSTOMER", new.id, "INS", user());
end$$

delimiter ;

INSERT INTO customer (idcode, firstname, lastname, gender) 
VALUES (3809519243, "Jaanus", "TAMM", 'M')
