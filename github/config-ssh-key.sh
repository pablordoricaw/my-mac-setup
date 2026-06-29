#!/usr/bin/env bash

key_name=github_id_ed25519
host=*.github.com

if test "$(gh --version)"
  then
  echo "🗝️ Generating new SSH key for github.com..."
  ssh-keygen -t ed25519 -f $HOME/.ssh/${key_name}

  echo "🤵‍♂️ Adding your SSH key to the ssh-agent..."
  echo -e "Host ${host}\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/${key_name}" >> ${HOME}/.ssh/config
  ssh-add --apple-use-keychain $HOME/.ssh/${key_name}

  echo "🔐 Logging in to GitHub over SSH and uploading your key..."
  echo "   When prompted:"
  echo "     - pick a way to authenticate (web browser or a token)"
  echo "     - select the public key '${key_name}.pub' to upload"
  echo "     - give it a title, e.g. 'user@computername'"
  gh auth login --git-protocol ssh
  
  echo "🔁 Testing SSH connection with GitHub..."
  ssh -T git@github.com
  
else
  echo "❌ gh is not installed."
  echo "  - run brew install gh to install it."
fi
