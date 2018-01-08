#!/bin/bash
echo "Starting docker compose project"
docker-compose up -d

echo "Waiting for Docker Containers to start..."
sleep 10

echo "Cloning Sample App repo"
ssh-keygen -R [localhost]:2222
git clone ssh://git@localhost:2222/git-server/repos/rallyjenkinsdemo-sampleapp.git sampleapp

echo "Opening Browsers"
open *.webloc

echo "Done"
