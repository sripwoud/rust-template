DEV_BIN_DIR := .cargo/bin
CYAN := \033[36m
RESET := \033[0m
export PATH := $(DEV_BIN_DIR):$(PATH)

.PHONY: fmt build test setup

help: ## display this help message (default task)
	@printf "%b\n" "Usage: make [$(CYAN)task$(RESET)]"
	@printf "%s\n" "Available tasks:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "$(CYAN)%-20s$(RESET) %s\n", $$1, $$2}'

build:
	@cargo build

check: ## check that all files match formatting rules
	@dprint check

fmt: ## format all files
	@dprint fmt

setup: ## run the setup script to install dependencies
	@./.setup.sh

test: ## run all tests
	@cargo nextest run
