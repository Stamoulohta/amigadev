.PHONY: pull buld up down stop dev uae test-amiga

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

uae:
	docker compose exec --interactive --tty uae /usr/bin/env bash

test-amiga:
	docker compose exec uae fs-uae /configs/test-a500.fs-uae
