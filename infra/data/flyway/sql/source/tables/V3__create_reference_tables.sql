



CREATE TABLE if not exists qa_data_platform.airlines (
	id serial primary key,
	"name" varchar(70) null,
	code varchar(2) null,
	country varchar(25) null,
	headquarters varchar(30) null,
	website varchar(70) null,
	created timestamp default current_timestamp 
);



CREATE table if not exists qa_data_platform.contact_info (
	id serial primary key,
	phone varchar(30) null,
	email varchar(70) null,
	website varchar(70) null,
	created timestamp default current_timestamp
);



CREATE table if not exists qa_data_platform.airports (
	id serial primary key,
	"name" varchar(70) null,
	code varchar(3) null,
        city varchar(20) null,
	country varchar(20) null,
	services varchar(100) null,
	id_contact_info int4  unique,
	created timestamp default current_timestamp, 
	FOREIGN KEY (id_contact_info) REFERENCES qa_data_platform.contact_info(id)
);




