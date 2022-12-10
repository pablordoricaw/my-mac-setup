#!/usr/bin/env bash

dotfiles_repo=pablordoricaw/my-macos-dotfiles.git

if test "$(chezmoi --version)"
  then
  echo "⬇️ Downloading Dotfiles from the GitHub repo ${dotfiles_repo}..."
  echo "🗝️ Having SSH Keys setup is needed for this step."
  read -r -q "REPLY?Do you have SSH Keys setup (y/n)";
  echo "";
  
  echo "🗝️ Downloading Dotfiles..."
  chezmoi init --apply git@github.com:${dotfiles_repo}
else
  echo "❌ chezmoi is not installed."
  echo "  - run brew install chezmoi to install it."
fi
