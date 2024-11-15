CREATE table if not exists data_platform_test.passengers_staging (
	id_receipt varchar(100),
	fi varchar(50),
	birth_date varchar(70)

)
DISTRIBUTED BY (id_receipt);


CREATE TABLE if not exists data_platform_test.receipt_staging(
	_id varchar(50),
	id_travel varchar(10),
	id_user varchar(10),
	amount varchar(100),
	code_departure varchar(3),
	code_arrival varchar(3),
	number_of_passengers varchar(5),
	created varchar(70)
)
DISTRIBUTED BY (_id);