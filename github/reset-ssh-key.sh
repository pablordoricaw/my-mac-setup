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

  # Code from Cyrus' comment on https://stackoverflow.com/questions/36110829/how-can-i-remove-a-host-entry-from-an-ssh-config-file
  echo "Removing GitHub entry in ~/.ssh/config..."
  sed 's/^Host/\n&/' file | sed '/^Host '"$host"'$/,/^$/d;/^$/d'

  echo "🔁 Deleting SSH key from your GitHub account..."
  gh ssh-key list
  echo "🆔 Please copy from above & paste below the ID of the SSH key to delete and hit ENTER."
  read key_id
  gh ssh-key delete ${key_id}

  echo "⭐ Deleted SSH key!"

else
  echo "❌ gh is not installed."
  echo "  - run brew install gh to install it."
fi