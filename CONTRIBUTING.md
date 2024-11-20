Шаги по настройке

1. Клонируйте репизиторий от ветки dev
   git clone https://github.com/AnnPenchuk/new_flyway.git

2. Перед внесением изменений создайте новую ветку:
      git checkout -b feature/LRN-194 dev

3. Создайте виртуальное окружение:
	python -m .venv
	.venv\Scripts\activate 

4. Установите poetry:
	pip install poetry
	poetry init --no-root

5. Линтинг кода после внесения своих изменений:
    sqlfluff lint . 

    sqlfluff fix .   

6. Внесите свои изменения, затем создайте и запустите контейнеры с помощью Docker Compose:
    docker compose -f docker-compose-source.yml up -d

    docker compose -f docker-compose-target.yml up -d
    
    docker compose -f docker-compose-flyway-source.yml up
    
    docker compose -f docker-compose-flyway-target.yml up


7. Создание коммита и отправка изменений в свою ветку:
    git add .
    git commit -m "ваш комментарий"
    git push -u origin [название ветки]

    

