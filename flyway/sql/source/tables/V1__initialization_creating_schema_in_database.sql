CREATE SCHEMA IF NOT EXISTS qa_data_platform;

GRANT USAGE ON SCHEMA qa_data_platform TO admin;

GRANT
SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA qa_data_platform TO admin;

GRANT
CREATE ON SCHEMA qa_data_platform TO admin;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA qa_data_platform TO admin;


ALTER DEFAULT PRIVILEGES IN SCHEMA qa_data_platform GRANT EXECUTE ON FUNCTIONS TO admin;


ALTER DEFAULT PRIVILEGES IN SCHEMA qa_data_platform GRANT
SELECT,
INSERT,
UPDATE,
DELETE ON TABLES TO admin;
