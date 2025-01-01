LOCALCOMPOSE := ./docker/local/compose.yaml

local:
	docker compose -f $(LOCALCOMPOSE) up
