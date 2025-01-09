
-------RAW-------------------------------------


CREATE TABLE data_platform_test.raw_airlines (
	id int4,
	name varchar (30),
	code char(2),
	country varchar(25),
	headquarters varchar(30),
	website varchar(2048),
	created timestamp,
	hash varchar(100) null
);




CREATE  TABLE data_platform_test.raw_airports (
	id int4,
	name varchar(70),
	code char(3),
	country varchar(20),
	services varchar(100),
	id_contact_info int4,
	created timestamp,
	hash varchar(100) null
);



CREATE TABLE data_platform_test.raw_location (
	id int4,
	street_number int4,
	street_name varchar(50),
	city varchar(40),
	created timestamp,
	hash varchar(100) null
);




CREATE TABLE data_platform_test.raw_contact (
	id int4,
	phone varchar(30),
	email 	varchar(70),
	website varchar(70),
	created timestamp,
	hash varchar(100) null
);




CREATE  TABLE data_platform_test.raw_reciept (
	_id varchar(40) null,
	travel int8,
	payer int8,
	amount int8,
	code_departure varchar(7),
	code_arrival varchar(7),
	number_of_passengers int8,
	--passengers jsonb,
	created timestamp,
	hash varchar(100) null
);




CREATE table data_platform_test.raw_passengers (
	id varchar(100) null,
	fi varchar(50) null,
	birth_date varchar(50),
	hash varchar(100),
	created varchar(50)

);




CREATE TABLE data_platform_test.raw_travel (
	id int4,
	airlines varchar(100),
	airports_departure varchar(100),
	code_departure char(3),
	airport_arrivals varchar(110),
	code_arrival char(3),
	price varchar(6),
	created timestamp,
	hash varchar(100) null
);





CREATE TABLE data_platform_test.raw_users (
	id int4,
	name_first varchar(30),
	name_last varchar(30),
	id_location int4,
	email varchar(40),
	username varchar(30),
	password varchar(30),
	birth_date timestamp,
	phone varchar(50),
	created timestamp,
	hash varchar(100) null
);



