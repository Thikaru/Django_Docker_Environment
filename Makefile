up:
	docker compose up -d
build:
	docker compose build
web-container:
	docker exec -it web /bin/bash
db-container:
	docker exec -it db /bin/bash
ps:
	docker compose ps
down:
	docker compose down
down-all:
	docker compose down --rmi all --volumes --remove-orphans
migrate:
	docker compose exec web python3 manage.py migrate
run-serve:
	docker compose exec web python3 manage.py runserver 0.0.0.0:8555