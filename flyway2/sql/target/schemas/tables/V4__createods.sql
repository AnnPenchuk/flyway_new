CREATE TABLE IF NOT EXISTS data_platform_test.receipt_ods (
    _id varchar(50) PRIMARY KEY,
    id_travel int4 NULL,
    id_user int4 NULL,
    amount float4 NULL,
    code_departure varchar(3) NULL,
    code_arrival varchar(3) NULL,
    number_of_passengers int4 NULL,
    created timestamp NULL,
    hash varchar(100) NULL
)

DISTRIBUTED BY (_id);

CREATE TABLE IF NOT EXISTS data_platform_test.passengers_ods (
    id_receipt varchar(100) NULL,
    fi varchar(50) NULL,
    birth_date timestamp NULL,
    hash varchar(100) NULL,
    FOREIGN KEY (id_receipt) REFERENCES data_platform_test.receipt_ods (_id)

)
DISTRIBUTED BY (id_receipt);
