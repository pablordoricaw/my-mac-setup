#!/usr/bin/env bash

key_name=github_id_ed25519

if test "$(gh --version)"
  then
  echo "🗝️ Generating new SSH key for github.com..."
  ssh-keygen -t ed25519 -f $HOME/.ssh/${key_name}

  echo "🤵‍♂️ Adding your SSH key to the ssh-agent..."
  echo -e "Host *.github.com\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/${key_name}" >> ${HOME}/.ssh/config

  echo "🔁 Adding your SSH key to your GitHub account..."
  gh ssh-key add $HOME/.ssh/${key_name}.pub
else
  echo "❌ gh is not installed."
  echo "  - run brew install gh to install it."
fi
