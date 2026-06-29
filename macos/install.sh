#!/usr/bin/env bash

# shellcheck source=lib/profile.sh
source ./lib/profile.sh
resolve_profile "$1" || exit 1

echo "⬇️ Installing App Store applications for profile '${PROFILE}'..."
echo "📝 Note that you need mas installed and to be signed into the App Store."
read -r -q "REPLY?Do you want to continue the installation? (y/n)"
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  # skip this step without killing the parent installer when sourced
  return 0 2>/dev/null || exit 0
fi

if test "$(which mas)"
  then
  while IFS= read -r app; do
    if [[ "$app" == lucky:* ]]; then
      query="${app#lucky:}"
      echo "⬇️ Installing (via search) ${query}..."
      mas lucky "$query"
    else
      echo "⬇️ Installing app id ${app}..."
      mas install "$app"
    fi
  done < <(read_list macos/mas.common; read_list "macos/mas.${PROFILE}")

  echo "⭐ Installed applications!"

else
  echo "❌  mas is not installed."
  echo "  - run brew install mas to install it."
fi
