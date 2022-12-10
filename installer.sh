#!/usr/bin/env bash

# Find and run all installers.

parent_path=$( pwd -P )
cd "$parent_path" || exit

echo "\\n🔎 Installers found..."
find . -name "install.sh" | while read -r installer ; do echo "  - ${installer}" ; done

echo "";

read -r -q "REPLY?Proceed with installation? (y/n) ";

echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "⚙️  Running installers..."
  # shellcheck source=/dev/null
  find . -name "install.sh" | while read -r installer ; do source "${installer}" ; done
fi;
