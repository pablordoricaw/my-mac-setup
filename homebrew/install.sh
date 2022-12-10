#!/usr/bin/env bash

echo "⬇️  Installing Homebrew..."
sudo -v

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

if [[ $PATH != *"brew"* ]]; then
  echo "📝 Adding Homebrew to PATH..."
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/pablordoricaw/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/pablordoricaw/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "⭐️ Homebrew is in your PATH. You can now use it!"
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