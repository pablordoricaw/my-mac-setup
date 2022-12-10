#!/usr/bin/env bash

key_name=github_id_ed25519

echo "🗝️ Generating new SSH key for github.com..."
ssh-keygen -t ed25519 -f $HOME/.ssh/${key_name}

echo "🤵‍♂️ Adding your SSH key to the ssh-agent..."
echo -e "Host *.github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/${key_name}" >> ${HOME}/.ssh/config

echo "🔁 Adding your SSH key to your GitHub account..."
if test "$(gh --version)"
  then
  gh ssh-key add $HOME/.ssh/${key_name}
else
  echo "❌ GitHub CLI is not installed." 
  echo "  - Failed adding key to GitHub account."
fi
