include env_make
NS = stelzer77
VERSION ?= latest

REPO = telefraf-armhf

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)


release: build
	make push -e VERSION=$(VERSION)

default: build
