CREATE TABLE IF NOT EXISTS source_dev.public.test (
    _id TEXT,
    travel BIGINT,
    payer BIGINT,
    amount BIGINT,
    code_departure TEXT,
    code_arrival TEXT,
    number_of_passengers TEXT,
    passengers TEXT,
    created TEXT
);




INSERT INTO source_dev.public.test (_id,travel,payer,amount,code_departure,code_arrival,number_of_passengers,passengers,created)
VALUES ('6707fa42840c437097f7b593', 3,1,26092, 'SIN','ICN','4','passenger: "Zoe Barnaby",
      "birth_date": "1993-09-2','1728576066102');
