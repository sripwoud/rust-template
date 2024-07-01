DEV_BIN_DIR := .cargo/bin
CYAN := \033[36m
RESET := \033[0m
export PATH := $(DEV_BIN_DIR):$(PATH)

.PHONY: fmt build test setup

help:
	@echo "Usage: make [task]"
	@echo "Available tasks:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "$(CYAN)%-20s$(RESET) %s\n", $$1, $$2}'

check: ## check that all files match formatting rules
	@dprint check

fmt: ## format all files
	@dprint fmt

setup: ## run the setup script to install dependencies
	@./.setup.sh
