Конфигурации Docker Compose для источника(postgres) и приемника(greenplum)
  
  docker-compose-source.yml 

  docker-compose-target.yml

Конфигурации Docker Compose с flyway для создания структуры базы данных

 docker-compose-flyway-source.yml  
 docker-compose-flyway-target.yml 

Пути к папке с toml и папке с миграциями sql

  volumes:
      - ../flyway/project/target:/flyway/project/target
      - ../flyway/sql/target:/flyway/sql/target
Команда для запуска миграций в файле docker-compose-flyway-target.yml, для второго файла аналогично:

  entrypoint: >
      /bin/sh -c "
      sleep 30;
      flyway -configFiles=/flyway/project/target/flyway-target.toml migrate; 

 В папке flyway/project в файлах toml:
 
 url контейнера с базой данных, логин и пароль пользователя, 
 в locations путь к папке с файлами миграций

Развернуть контейнер с postgres:

  docker compose -f docker-compose-source.yml up -d

Развернуть контейнер с greenplum:

  docker compose -f docker-compose-target.yml up -d

Развернуть контейнер с flyway для postgres:

  docker compose -f docker-compose-flyway-source.yml up

Развернуть контейнер с flyway для greenplum:

  docker compose -f docker-compose-flyway-target.yml up 

Для запуска миграций вручную:
  docker exec -it source_flyway flyway -configFiles=/flyway/project/source/flyway-source migrate
  docker exec -it target_flyway flyway -configFiles=/flyway/project/target/flyway-target migrate

ДЛЯ БЫСТРОГО ЗАПУСКА:
для запуска поочередно всех контейнеров
 make all

для выполнения отдельных команд ознакомьтесь с makefile