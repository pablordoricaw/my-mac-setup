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

echo "⬇️ Uinstalling applications with Homebrew..."
read -r -q "REPLY?Are you sure you want to proceed? (y/n) ";
echo "";
brew uninstall --cask dozer
brew uninstall --cask google-chrome
brew uninstall --cask iterm2
brew uninstall --cask lastpass
brew uninstall --cask miniconda
brew uninstall --cask notion
brew uninstall --cask rocket
brew uninstall --cask slack
brew uninstall --cask spectacle
brew uninstall --cask spotify
brew uninstall --cask visual-studio-code