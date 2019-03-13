IMAGE=tmweek/circleci:latest

default:
	@docker build -t ${IMAGE} .

push:
	@docker push ${IMAGE}

.PHONY: push default
