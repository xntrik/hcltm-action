DOCKERNAME=xntrik/hcltm-action
VERSION=v0.0.13

default: help

image: ## Create local docker image
	@docker build -t $(DOCKERNAME) .

imagepush-dev: ## Create a fresh docker image and push to the configured repo as dev
	@docker build --rm --force-rm -t $(DOCKERNAME):dev .
	@docker push $(DOCKERNAME):dev

imagepush: ## Create a fresh docker image and push to the configured repo
	@docker build --rm --force-rm -t $(DOCKERNAME):latest -t $(DOCKERNAME):$(VERSION) .
	@docker push -a $(DOCKERNAME)

help: ## Output make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
