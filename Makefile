DOCKERNAME=xntrik/hcltm-action

default: help

image: ## Create local docker image
	@docker build -t $(DOCKERNAME) .

imagepush: ## Create a fresh docker image and push to the configured repo
	@docker build --rm --force-rm -t $(DOCKERNAME):latest .
	@docker push $(DOCKERNAME)

help: ## Output make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
