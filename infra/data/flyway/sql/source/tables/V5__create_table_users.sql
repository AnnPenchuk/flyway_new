
CREATE table if not exists qa_data_platform."location" (
	id serial primary key,
	street_number int4 NULL,
	street_name varchar(50) NULL,
	city varchar(40) NULL,
	country varchar(40) NULL,
	created timestamp default current_timestamp NOT NULL
);



CREATE table if not exists qa_data_platform.users (
	id serial primary key,
	name_first varchar(30) null,
	name_last varchar(30) null,
	id_location INT4 unique,
	email varchar(40) null,
	username varchar(30) null,
	"password" varchar(30) null,
	birth_date timestamp null,
	phone varchar(50) null,
	created timestamp default current_timestamp NOT NULL,
	foreign key (id_location) references qa_data_platform.location(id)
);

