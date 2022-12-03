VERSION ?= latest
REGISTRY ?= yndd
IMG ?= $(REGISTRY)/nad-inject-fn:${VERSION}

.PHONY: all
all: test

fmt: ## Run go fmt against code.
	go fmt ./...

vet: ## Run go vet against code.
	go vet ./...

test: fmt vet ## Run tests.
	kpt fn render data

docker-build:  ## Build docker images.
	docker build -t ${IMG} .

docker-push: ## Build docker images.
	docker push ${IMG}