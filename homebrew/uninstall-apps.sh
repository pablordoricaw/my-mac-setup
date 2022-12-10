#!/usr/bin/env bash

echo "⬇️ Unistalling applications with Homebrew..."
read -r -q "REPLY?Are you sure you want to proceed? (y/n) ";
echo "";

if test "$(brew --version)" ; then
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
  echo "⭐️ Uninstalled Applications installed with Homebrew!"
else
  echo "❌ Can't uninstall applications"
  echo "  - Homebrew not installed or not in PATH"
fi