#!/usr/bin/env bash

# shellcheck source=lib/profile.sh
source ./lib/profile.sh
resolve_profile "$1" || exit 1

echo "⬇️  Installing Homebrew..."
sudo -v

if test ! "$(brew --version)"
  then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && \
  echo "⭐️ Installed Homebrew!"
else
  echo "🔁 Homebrew is already installed! Updating instead."
  brew update
fi

if [[ $PATH != *"brew"* ]]; then
  echo "📝 Adding Homebrew to PATH..."
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> "$HOME/.zprofile"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "⭐️ Homebrew is in your PATH. You can now use it!"
fi

echo "🔁 Setting up additional Taps..."
brew tap homebrew/cask-drivers # needed for Elgato Control Center

echo "⬇️ Installing Homebrew formulae for profile '${PROFILE}'..."
while IFS= read -r formula; do
  brew install "$formula"
done < <(read_list homebrew/formulae.common; read_list "homebrew/formulae.${PROFILE}")

echo "⬇️ Installing applications with Homebrew for profile '${PROFILE}'..."
while IFS= read -r cask; do
  brew install --cask "$cask"
done < <(read_list homebrew/casks.common; read_list "homebrew/casks.${PROFILE}")

if [[ -z "$RUN_BY_INSTALLER" ]]; then
  echo "This session will be terminated. Open a new session to use the newly installed formulae"
  exit
fi
