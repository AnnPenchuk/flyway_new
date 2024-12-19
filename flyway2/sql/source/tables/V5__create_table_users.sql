CREATE TABLE IF NOT EXISTS qa_data_platform.location (
    id serial PRIMARY KEY,
    street_number int4 NULL,
    street_name varchar(50) NULL,
    city varchar(40) NULL,
    country varchar(40) NULL,
    created timestamp DEFAULT current_timestamp NOT NULL
);



CREATE TABLE IF NOT EXISTS qa_data_platform.users (
    id serial PRIMARY KEY,
    name_first varchar(30) NULL,
    name_last varchar(30) NULL,
    id_location int4 UNIQUE,
    email varchar(40) NULL,
    username varchar(30) NULL,
    password varchar(30) NULL,
    birth_date timestamp NULL,
    phone varchar(50) NULL,
    created timestamp DEFAULT current_timestamp NOT NULL,
    FOREIGN KEY (id_location) REFERENCES qa_data_platform.location (id)
);
