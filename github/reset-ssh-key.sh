#!/usr/bin/env bash

key_name=github_id_ed25519
host=*.github.com

if test "$(gh --version)"
  then

  echo "🆕 Deleting SSH key..."
  read -r -q "REPLY?Are you sure you want to proceed? (y/n) ";
  echo "";

  echo "🔁 Deleting SSH key locally..."
  rm ${HOME}/.ssh/${key_name}
  rm ${HOME}/.ssh/${key_name}.pub

  echo "Removing GitHub entry in ~/.ssh/config..."
  sed 's/^Host/\n&/' file | sed '/^Host '"$host"'$/,/^$/d;/^$/d'

  echo "🔁 Deleting SSH key from your GitHub account..."
  echo "🔁 Please copy the ID of the SSH key to delete"
  gh ssh-key list
  echo "🆔 Please enter the ID of the SSH key to delete"
  read key_id
  gh ssh-key delete ${key_id}

  echo "⭐ Deleted SSH key!"

else
  echo "❌ gh is not installed."
  echo "  - run brew install gh to install it."
fi