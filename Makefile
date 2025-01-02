.PHONY: help
.DEFAULT_GOAL := help

LOCALYAML := ./docker/local/compose.yaml
DEVYAML := ./docker/develop/compose.yaml

local: ## local環境でコンテナを起動
	docker compose -f $(LOCALYAML) up -d
local_rebuild: ## local環境でコンテナをリビルド
	docker compose -f $(LOCALYAML) up --build
local_ps: ## local環境でコンテナの起動状況を確認
	docker compose -f $(LOCALYAML) ps
local_down: ## local環境でコンテナを停止
	docker compose -f $(LOCALYAML) down
dev: ## dev環境でコンテナを起動
	docker compose -f $(DEVYAML) up
dev_rebuild: ## dev環境でコンテナをリビルド
	docker compose -f $(DEVYAML) up --build
dev_ps: ## dev環境でコンテナの起動状況を確認
	docker compose -f $(DEVYAML) ps
dev_down: ## dev環境でコンテナを停止
	docker compose -f $(DEVYAML) down
help: ## ヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
