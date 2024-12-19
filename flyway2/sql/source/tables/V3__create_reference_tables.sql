CREATE TABLE IF NOT EXISTS qa_data_platform.airlines (
    id serial PRIMARY KEY,
    name varchar(70) NULL,
    code varchar(2) NULL,
    country varchar(25) NULL,
    headquarters varchar(30) NULL,
    website varchar(70) NULL,
    created timestamp DEFAULT current_timestamp
);



CREATE TABLE IF NOT EXISTS qa_data_platform.contact_info (
    id serial PRIMARY KEY,
    phone varchar(30) NULL,
    email varchar(70) NULL,
    website varchar(70) NULL,
    created timestamp DEFAULT current_timestamp
);



CREATE TABLE IF NOT EXISTS qa_data_platform.airports (
    id serial PRIMARY KEY,
    name varchar(70) NULL,
    code varchar(3) NULL,
    city varchar(20) NULL,
    country varchar(20) NULL,
    services varchar(100) NULL,
    id_contact_info int4 UNIQUE,
    created timestamp DEFAULT current_timestamp,
    FOREIGN KEY (id_contact_info) REFERENCES qa_data_platform.contact_info (id)
);
