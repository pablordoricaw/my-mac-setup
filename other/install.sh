#!/usr/bin/env bash

DOWNLOADS_PATH=$HOME/Downloads
DOCKER_INSTALLER_NAME=Docker.dmg
DOCKER_USERNAME=pablordoricaw

echo "Installing other..."

###        ###
#   DOCKER   #
###        ###
echo "Installing Docker..."
echo "Docker installer needs to be downloaded from docker.com"

if test -f "$DOWNLOADS_PATH/$DOCKER_INSTALLER_NAME"; then
    echo "Installer found in $DOWNLOADS_PATH/"

    sudo hdiutil attach $DOWNLOADS_PATH/$DOCKER_INSTALLER_NAME
    sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license --user=$DOCKER_USERNAME
    sudo hdiutil detach /Volumes/Docker

else
    echo "Installer NOT found in $DOWNLOADS_PATH/"
    echo "Skipping Docker installation..."
fi