#!/bin/bash
set -e
echo "Checking basic requirements"

if ! docker info > /dev/null; then
  echo 'Error connecting to docker'
  exit 1
fi

mem=$(docker info | grep 'Total Memory' | cut -d: -f2 | cut -dG -f1 | awk '{$1=$1};1')

if [ $(echo "$mem<3.8" | bc) -eq 1 ]; then
  echo 'ERROR: Docker Daemon must be configured to use >= 4GB of RAM to run this workshop'
  exit 1
fi

echo "Pulling docker images"
./prep_workstation.sh

echo "Starting docker compose project"
docker-compose up -d

echo "Waiting for Docker Containers to start..."
sleep 10

ssh-keygen -R [localhost]:2222

if [ -d sampleapp ]; then
  echo "Skipping clone of sample app repo"
else
  echo "Cloning Sample App repo"
  git clone ssh://git@localhost:2222/git-server/repos/rallyjenkinsdemo-sampleapp.git sampleapp
fi

echo "Opening Browsers"
open *.webloc

echo "Done"
