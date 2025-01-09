
-------------------------------data vault----------------------------

----создание хабов

create table data_platform_test.airlines_hub (
	bk_airlines varchar(100) not null primary key,
	recourse varchar(15) null,
	date_load timestamp default now() null
) DISTRIBUTED BY (bk_airlines);


create table data_platform_test.airports_hub (
	bk_airports varchar(100) not null primary key,
	recourse varchar(15) null,
	date_load timestamp default now() null
) DISTRIBUTED BY (bk_airports);


create table data_platform_test.users_hub (
	bk_users varchar(100) not null primary key,
	recourse varchar(15) null,
	date_load timestamp default now() null
) DISTRIBUTED BY (bk_users);


create table data_platform_test.reciept_hub (
	bk_reciept varchar(100) not null primary key,
	recourse varchar(15) null,
	date_load timestamp default now() null
) DISTRIBUTED BY (bk_reciept);



create table data_platform_test.travel_hub (
	bk_travel varchar(100) not null primary key,
	recourse varchar(15) null,
	date_load timestamp default now() null
) DISTRIBUTED BY (bk_travel);





----создание сателитов

create table data_platform_test.users_sat (
	bk_users varchar(100) null,
	id int4 null,
	name_first varchar(30) NULL,
	name_last varchar(30) NULL,
	email varchar(40) NULL,
	username varchar(30) NULL,
	"password" varchar(30) NULL,
	birth_date timestamp NULL,
	phone varchar(50) NULL,
	street_number int4 NULL,
	street_name varchar(50) NULL,
	city varchar(40) NULL,
	created timestamp null,
	date_start timestamp null,
	date_end timestamp null,
	hash varchar(100) null,
	active BOOL default true null,
	FOREIGN KEY (bk_users) REFERENCES public.users_hub(bk_users)
) DISTRIBUTED BY (bk_users);




CREATE TABLE data_platform_test.travel_sat (
	bk_travel varchar(100) null,
	id int4 null,
	airlines varchar(100) NULL,
	airports_departure varchar(100) NULL,
	code_departure bpchar(3) NULL,
	airport_arrivals varchar(110) NULL,
	code_arrival bpchar(3) NULL,
	price varchar(6) NULL,
	created timestamp null,
	date_start timestamp null,
	date_end timestamp null,
	hash varchar(100) NULL,
	active BOOL default true null,
	FOREIGN KEY (bk_travel) REFERENCES public.travel_hub(bk_travel)
	) DISTRIBUTED BY (bk_travel);


CREATE TABLE data_platform_test.airlines_sat (
	bk_airlines varchar(100) null,
	id int4 null,
	"name" varchar(30) NULL,
	code bpchar(2) NULL,
	country varchar(25) NULL,
	headquarters varchar(30) NULL,
	website varchar(2048) NULL,
	created timestamp null,
	date_start timestamp null,
	date_end timestamp null,
	hash varchar(100) NULL,
	active BOOL default true null,
	FOREIGN KEY (bk_airlines) REFERENCES public.airlines_hub(bk_airlines)
	) DISTRIBUTED BY (bk_airlines);



CREATE TABLE data_platform_test.airports_sat (
	bk_airports varchar(100) null,
	id int4 null,
	"name" varchar(70) NULL,
	code bpchar(3) NULL,
	country varchar(25) NULL,
	services varchar(100) NULL,
	phone varchar(48) NULL,
	email varchar(2048) NULL,
	website varchar(2048) NULL,
	created timestamp null,
	date_start timestamp null,
	date_end timestamp null,
	hash varchar(100) NULL,
	active BOOL default true null,
	FOREIGN KEY (bk_airports) REFERENCES public.airports_hub(bk_airports)
	) DISTRIBUTED BY (bk_airports);



CREATE TABLE data_platform_test.reciept_sat (
	bk_reciept varchar(100) null,
	amount int8,
	code_departure varchar,
	code_arrival varchar,
	number_of_passengers int8,
	fi varchar,
	birth_date varchar,
	created timestamp null,
	date_start timestamp null,
	date_end timestamp null,
	hash varchar(100) NULL,
	active BOOL default true null,
	FOREIGN KEY (bk_reciept) REFERENCES public.reciept_hub(bk_reciept)
	) DISTRIBUTED BY (bk_reciept);




---создание линков


create table data_platform_test.link_reciept_users (
	bk_reciept varchar(100) not null,
	bk_users varchar(100) not  null,
	hash varchar(100) null,
	date_load timestamp default now() null,
    FOREIGN KEY (bk_reciept) REFERENCES public.reciept_hub(bk_reciept),
    FOREIGN KEY (bk_users) REFERENCES public.users_hub(bk_users)
) DISTRIBUTED BY (bk_reciept);




create table data_platform_test.link_airports_travel (
	bk_airports varchar(100) not null,
	bk_travel varchar(100) not  null,
	hash varchar(100) null,
	date_load timestamp default now() null,
    FOREIGN KEY (bk_airports) REFERENCES public.airports_hub(bk_airports),
    FOREIGN KEY (bk_travel) REFERENCES public.travel_hub(bk_travel)
) DISTRIBUTED BY (bk_airports);





create table data_platform_test.link_airlines_travel (
	bk_airlines varchar(100) not null,
	bk_travel varchar(100) not  null,
	hash varchar(100) null,
	date_load timestamp default now() null,
    FOREIGN KEY (bk_airlines) REFERENCES public.airlines_hub(bk_airlines),
    FOREIGN KEY (bk_travel) REFERENCES public.travel_hub(bk_travel)
) DISTRIBUTED BY (bk_airlines);




create table data_platform_test.link_reciept_travel (
	bk_reciept varchar(100) not null,
	bk_travel varchar(100) not  null,
	hash varchar(100) null,
	date_load timestamp default now() null,
    FOREIGN KEY (bk_reciept) REFERENCES public.reciept_hub(bk_reciept),
    FOREIGN KEY (bk_travel) REFERENCES public.travel_hub(bk_travel)
) DISTRIBUTED BY (bk_reciept);







