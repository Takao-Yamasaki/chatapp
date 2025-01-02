LOCALYAML := ./docker/local/compose.yaml
DEVYAML := ./docker/develop/compose.yaml

.PHONY: help
.DEFAULT_GOAL := help

local: ## local環境でコンテナを起動
	docker compose -f $(LOCALYAML) up -d
build: ## local環境でコンテナをビルド
	docker compose -f $(LOCALYAML) build --no-cache 
ps: ## local環境でコンテナの起動状況を確認
	docker compose -f $(LOCALYAML) ps
login: ## local環境でコンテナに入る
	docker compose -f $(LOCALYAML) exec -it chatapp_local sh
down: ## local環境でコンテナを停止
	docker compose -f $(LOCALYAML) down
dev: ## dev環境でコンテナを起動
	docker compose -f $(DEVYAML) up
dev_build: ## dev環境でコンテナをビルド
	docker compose -f $(DEVYAML) build --no-cache
dev_ps: ## dev環境でコンテナの起動状況を確認
	docker compose -f $(DEVYAML) ps
dev_login: ## dev環境でコンテナに入る
	docker compose -f $(LOCALYAML) exec -it chatapp_dev sh
dev_down: ## dev環境でコンテナを停止
	docker compose -f $(DEVYAML) down
help: ## ヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
