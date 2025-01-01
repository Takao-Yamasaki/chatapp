LOCALYAML := ./docker/local/compose.yaml

local:
	docker compose -f $(LOCALYAML) up
local_rebuild:
	docker compose -f $(LOCALYAML) up --build
