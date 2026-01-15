ENVFILE_DIR := .env.local
DOCKERCOMPOSEFILE_DIR := docker-compose.local.yml

.PHONY: dc-up dc-down github

dc-up:
	docker compose --env-file $(ENVFILE_DIR) -f $(DOCKERCOMPOSEFILE_DIR) up -d --build 

dc-down:
	docker compose --env-file $(ENVFILE_DIR) -f $(DOCKERCOMPOSEFILE_DIR) down 

github:
	@if "$(CM)"=="" ( \
		echo Usage: make github CM="commit message" && exit 1 \
	)
	git add .
	git commit -m "$(CM)"
	git push