
.PHONY: pull buld up down stop dev

pull:
	docker compose pull

build:
	docker compose down
	docker compose build

up:
	docker compose up --detach

down:
	docker compose down

stop:
	docker compose stop

dev:
	docker compose exec --interactive --tty dev /usr/bin/env bash
