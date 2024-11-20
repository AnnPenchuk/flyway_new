Шаги по настройке

1. Перед внесением изменений создайте новую ветку:
      git checkout -b feature-branch

2. Клонируйте репизиторий на локальную машину
   git clone https://github.com/AnnPenchuk/new_flyway.git

3. Создайте и запустите контейнеры с помощью Docker Compose:
   Развернуть контейнер с postgres:

    docker compose -f docker-compose-source.yml up -d
    
    Развернуть контейнер с greenplum:
    
    docker compose -f docker-compose-target.yml up -d
    
    Развернуть контейнер с flyway для postgres:
    
    docker compose -f docker-compose-flyway-source.yml up
    
    Развернуть контейнер с flyway для greenplum:
    
    docker compose -f docker-compose-flyway-target.yml up
4. Flyway автоматически попытается выполнить миграцию с использованием конфигурации из файла .toml . 
    Для запуска миграций вручную: 
docker exec -it source_flyway flyway -configFiles=/flyway/project/source/flyway-source migrate 
docker exec -it target_flyway flyway -configFiles=/flyway/project/target/flyway-target migrate
5. Убедитесь, что ваши учётные данные для доступа к базе данных настроены правильно.



