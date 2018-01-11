#!/bin/bash

echo "Cleaning docker containers"
docker rm -f $(docker container ls -f name=rallyjenkins -qa)

echo "Deleting git repo"
rm -rf sampleapp

echo "Done"
