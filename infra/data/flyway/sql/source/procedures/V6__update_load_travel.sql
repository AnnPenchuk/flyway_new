CREATE OR REPLACE PROCEDURE qa_data_platform.travel()
AS $$
  begin 
      FOR i IN 1..floor(RANDOM() * (5-2)+2) LOOP
    INSERT INTO
    qa_data_platform.travel (airlines,
    airports_departure,
    airport_arrivals,
    price)
VALUES ((
SELECT
    name
FROM
    qa_data_platform.airlines
ORDER BY
    RANDOM()
LIMIT 1),
(
SELECT
    "name"
FROM
    qa_data_platform.airports
ORDER BY
    RANDOM()
LIMIT 1),
   (
SELECT
    "name"
FROM
    qa_data_platform.airports
ORDER BY
    RANDOM()
LIMIT 1),
FLOOR(RANDOM() * (20000 - 5000 + 1) + 5000));
END LOOP;
WITH cte1 AS (
SELECT
    DISTINCT code,
    a.name AS "name_"
FROM
    qa_data_platform.airports a
JOIN qa_data_platform.travel t ON
    a."name" = t.airports_departure
WHERE
    t.airports_departure = a."name")
UPDATE
    qa_data_platform.travel tr
SET
    code_departure = cte1.code
FROM
    cte1
WHERE
    tr.airports_departure = cte1."name_"
    AND tr.code_departure is NULL;
WITH cte2 AS(
SELECT
    DISTINCT code,
    a.name AS "name_"
FROM
    qa_data_platform.airports a
JOIN qa_data_platform.travel t ON
    a."name" = t.airport_arrivals
WHERE
    t.airport_arrivals = a."name")
UPDATE
    qa_data_platform.travel tr
SET
    code_arrival = cte2.code
FROM
    cte2
WHERE
    tr.airport_arrivals = cte2."name_"
    AND tr.code_arrival is NULL;
end;
$$language plpgsql;
call qa_data_platform.travel();
