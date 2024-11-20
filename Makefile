create_env:
	python -m .venv
	.venv\Scripts\activate

poetry:
	pip install poetry
	poetry init

sqlfluff:
	poetry add sqlfluff

lint:
	sqlfluff lint ./flyway/sql/**/*.sql --dialect postgres

up_source:
	docker-compose -f infra/docker-compose-source.yml up -d

up_target:
	docker-compose -f infra/docker-compose-target.yml up -d

migrate_source:
	docker-compose -f infra/docker-compose-flyway-source.yml up

migrate_target:
	docker-compose -f infra/docker-compose-flyway-target.yml up


all: up_source up_target migrate_source migrate_target

all_set: create_env poetry sqlfluff lint up_source up_target migrate_source migrate_target