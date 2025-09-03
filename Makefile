up:
	docker compose --env-file .env up -d --build
logs:
	docker compose --env-file .env logs -f --tail=200
