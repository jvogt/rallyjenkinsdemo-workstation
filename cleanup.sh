#!/bin/bash

echo "Cleaning docker containers"
docker-compose kill
docker kill rallyjenkinsdemo_git_prod
docker kill rallyjenkinsdemo_jenkins_prod
docker kill rallyjenkinsdemo_app_prod

echo "Deleting git repo"
rm -rf sampleapp

echo "Done"
