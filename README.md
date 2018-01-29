# Teamweek's Circle CI Docker Image

## Intro

Our base CircleCI image.
- Circle CI's Ruby docker image.
- qt5 (for Capybara Webkit) installed from apt.
- Node 8.9.1 (from Joyent's dockerfiles)
- Chrome latest
- Chromedriver latest

## Build

    docker build .

## Push to Dockerhub

Push to GitHub. Branch builds will be tagged in Dockerhub as `teamweek/circleci:$BRANCH_NAME`

## Release

Merge to master and tag. Tagged builds will be tagged in Dockerhub as `teamweek/circleci:$TAG`

Example

    git tag 0.0.5
    git push --tags

## Docker Hub

[https://hub.docker.com/r/teamweek/circleci/](https://hub.docker.com/r/teamweek/circleci/)
