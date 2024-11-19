CREATE TABLE IF NOT EXISTS qa_data_platform.travel (
    id serial PRIMARY KEY,
    airlines varchar(70) NULL,
    airports_departure varchar(70) NULL,
    code_departure varchar(3) NULL,
    airport_arrivals varchar(70) NULL,
    code_arrival varchar(3) NULL,
    price varchar(6) NULL,
    created timestamp DEFAULT current_timestamp
);
