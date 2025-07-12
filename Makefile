MVTS_PROJECT_DIR ?= $(PWD)
IMAGE_NAME ?= localhost:5000/multifleet_planner
GIT_TAG := $(shell cd $(MVTS_PROJECT_DIR) && git describe --dirty --abbrev=7 --tags --always --first-parent 2>/dev/null || echo "dev")
TAG ?= $(GIT_TAG)

.PHONY: all install build-image push-local

all: install build-image push-local

install:
	@echo "Installing Maven project using docker-compose builder..."
	docker compose run --rm builder

build-image:
	@echo "Building Docker image $(IMAGE_NAME):$(TAG)..."
	docker build -t $(IMAGE_NAME):$(TAG) $(MVTS_PROJECT_DIR)

push-local:
	@echo "Pushing Docker image to local registry..."
	docker push $(IMAGE_NAME):$(TAG)
	@echo "Docker image $(IMAGE_NAME):$(TAG) pushed successfully."

run:
	@echo "Running MVTS version ${MVTS_IMAGE}"
	docker compose run --rm mvts