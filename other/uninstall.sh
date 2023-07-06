#!/usr/bin/env bash

echo "Uninstalling other..."

echo "Uninstalling Docker..."
/Applications/Docker.app/Contents/MacOS/uninstall
test -f /Applications/Docker.app && echo "Docker Uninstalled successfully."

