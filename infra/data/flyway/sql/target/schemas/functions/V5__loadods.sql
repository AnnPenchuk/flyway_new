CREATE OR REPLACE FUNCTION data_platform_test.load_full_to_ods()
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    truncate
 table data_platform_test.receipt_ods;
insert
  into
   data_platform_test.receipt_ods
 ( _id,
	id_travel,
	id_user,
	amount,
	code_departure,
	code_arrival,
	number_of_passengers,
	created,
	hash)
select
	_id,
	id_travel::int,
	id_user::int,
	amount::float4,
	code_departure,
	code_arrival,
	number_of_passengers::int,
	created::timestamp,
	md5(concat(_id,
	id_travel,
	id_user,
	amount,
	number_of_passengers,
	created)) as hash
from
data_platform_test.receipt_staging;
 truncate
 table data_platform_test.passengers_ods;
insert
  into
  data_platform_test.passengers_ods
	(
	id_receipt,
	fi,
	birth_date,hash)
select
	id_receipt,
	fi,
	birth_date::timestamp,
	md5(concat(id_receipt,fi,
	birth_date)) as hash
from
data_platform_test.passengers_staging;
END;
$$;



CREATE OR REPLACE FUNCTION data_platform_test.load_ods()
RETURNS void
LANGUAGE plpgsql
as $$
  begin
   insert
  into
  data_platform_test.receipt_ods
	(_id,
	id_travel,
	id_user,
	amount,
	code_departure,
	code_arrival,
	number_of_passengers,
	created,
	hash)
 select
    f2."_id",
	f2.id_travel::int,
	f2.id_user::int,
	f2.amount::float4,
	f2.code_departure,
	f2.code_arrival,
	f2.number_of_passengers::int,
	f2.created::timestamp,
	md5(concat(f2."_id",
	f2.id_travel,
	f2.id_user,
	f2.amount,
	f2.number_of_passengers,
	f2.created)) as hash
from
    data_platform_test.receipt_staging as f2
left join data_platform_test.receipt_ods r on f2."_id" = r."_id"
where r.hash is null;
 insert
  into
  data_platform_test.passengers_ods
	(id_receipt,
	fi,
	birth_date,
	hash)
 select
    f2.id_receipt,
	f2.fi,
	f2.birth_date::timestamp,
	md5(concat(f2.id_receipt,f2.fi,
	f2.birth_date)) as hash
from
    data_platform_test.passengers_staging as f2
left join data_platform_test.passengers_ods p on f2.id_receipt = p.id_receipt
where p.hash is null;
END;
$$;


