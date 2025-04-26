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
  echo "⬇️ Installing Notability"
  mas install 360593530 # Notability
  echo "⬇️ Installing Perplexity"
  # mas install 1875466942 # Perplexity
  echo "⬇️ Installing Kindle"
  mas install 302584613

  # mas lucky install the first result that would be returned by mas search
  # mas install above not working so going with this route
  mas lucky "Perplexity: Ask Anything"

  echo "⭐ Installed applications!"

else
  echo "❌  mas is not installed."
  echo "  - run brew install mas to install it."
fi
