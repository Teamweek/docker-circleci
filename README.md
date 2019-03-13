# Teamweek's Circle CI Docker Image

## Intro

- Circle CI's Ruby + Node docker image. (circleci/ruby:2.5.0-node)

## Build

`docker build -t tmweek/circleci:latest .`

## Update on dockerhub

### login to dockeer hub:

docker login --username=teamweek
enter password found in 1pass

### push

docker push tmweek/circleci:latest

## Docker Hub

[https://hub.docker.com/r/teamweek/circleci/](https://hub.docker.com/r/tmweek/circleci/)
