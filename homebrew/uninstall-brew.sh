#!/usr/bin/env bash

echo "⬇️  Uninstalling Homebrew..."
read -r -q "REPLY?Are you sure you want to proceed? (y/n) ";
echo "";

if test "$(brew --version)"  
  then
  sudo -v
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)" \
  && \
  echo "🔁 Deleting /opt/homebrew" && \
  sudo rm -rf /opt/homebrew && \
  echo "⭐️ Uninstalled Homebrew!"
else
  echo "⭐️ Homebrew is already uninstalled!"
fi
