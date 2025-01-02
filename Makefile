LOCALYAML := ./docker/local/compose.yaml
DEVYAML := ./docker/develop/compose.yaml

local:
	docker compose -f $(LOCALYAML) up -d
local_rebuild:
	docker compose -f $(LOCALYAML) up --build
dev:
	docker compose -f $(DEVYAML) up
dev_rebuild:
	docker compose -f $(DEVYAML) up --build
