
.PHONY: pull buld run

pull:
	docker compose pull

build:
	docker compose down
	docker compose build

dev:
	docker compose exec --interactive --tty dev /usr/bin/env bash

run:
	docker compose run --remove-orphans dev
