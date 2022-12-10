#!/usr/bin/env bash

echo "⬇️  Installing Homebrew..."
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! "$(brew --version)"
  then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && \
  echo "⭐️ Installed Homebrew! This session will be terminated. Open a new session to continue."
  exit
else
  echo "🔁 Homebrew is already installed! Updating instead."
  brew update
fi

echo "⬇️ Installing Homebrew formulae..."
brew install chezmoi
brew install gh
brew install git
brew install mas

echo "⬇️ Installing applications with Homebrew..."
brew install --cask dozer
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask lastpass
brew install --cask miniconda
brew install --cask rocket
brew install --cask slack
brew install --cask spectacle
brew install --cask spotify
brew install --cask visual-studio-code

echo "This session will be terminated. Open a new session to use the newly installed formulae"