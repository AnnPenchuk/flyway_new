
CREATE table if not exists qa_data_platform.travel (
	id serial primary key,
	airlines varchar(70) null,  
	airports_departure varchar(70) null, 
	code_departure varchar(3) null, 
	airport_arrivals varchar(70) null, 
	code_arrival varchar(3) null, 
	price varchar(6) null, 
	created timestamp default current_timestamp 
);

