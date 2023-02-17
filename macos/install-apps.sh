#!/usr/bin/env bash

echo "⬇️ Installing App Store applications..."
echo "📝 Note that you need to have the CLI tool mas installed."
read -r -q "REPLY?Do you want to continue the installation? (y/n)";
echo "";

if test "$(which mas)"
  then
  
  echo "⬇️ Installing Unsplash Wallpaper..."
  mas install 1284863847 # Unsplash Wallpaper
  echo "⬇️ Installing TootFairy"
  mas install 1191449274 # ToothFairy
  echo "⬇️ Installing Things 3"
  mas install 904237743 # Things 3

  echo "⭐ Installed applications!"

else
  echo "❌  mas is not installed."
  echo "  - run brew install mas to install it."
fi