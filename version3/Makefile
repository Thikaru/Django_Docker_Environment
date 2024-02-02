up:
	docker-compose up
up-cache:
	docker-compose up --build
build:
	docker-compose build
down:
	docker-compose down
all-down:
	docker-compose down --rmi all --volumes --remove-orphans
test:
	docker-compose exec app python manage.py test
bash:
	docker-compose exec app bash
shell:
	docker-compose exec app python manage.py shell
version:
	docker-compose run --rm app pip list
update:
	docker-compose run --rm app pip install --upgrade requirements.txt
install:
	docker-compose exec app pip install -r requirements.txt