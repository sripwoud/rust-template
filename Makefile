##
# Project Title
#
# @file
# @version 0.1

.PHONY: fmt build test setup

LOCAL_BIN=.cargo/bin
export PATH := $(LOCAL_BIN):$(PATH)

CYAN=\033[36m
RESET=\033[0m

check: ## check that all files match formatting rules
	@dprint check

fmt: ## format all files
	@dprint fmt

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "$(CYAN)%-20s$(RESET) %s\n", $$1, $$2}'

setup: ## run the setup script to install dependencies
	@./.setup.sh

# end
