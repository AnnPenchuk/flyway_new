
CREATE TABLE if not exists data_platform_test.receipt_ods(
	_id varchar(50) primary key,
	id_travel int4 null,
	id_user int4 null,
	amount float4 null,
	code_departure varchar(3) null,
	code_arrival varchar(3) null,
	number_of_passengers int4 null,
	created timestamp null,
	hash varchar(100) null
)

DISTRIBUTED BY (_id);

CREATE table if not exists data_platform_test.passengers_ods (
	id_receipt varchar(100) null,
	fi varchar(50) null,
	birth_date timestamp null,
	hash varchar(100) null,
	foreign key (id_receipt) references data_platform_test.receipt_ods(_id)

)
DISTRIBUTED BY (id_receipt);

