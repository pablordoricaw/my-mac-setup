#!/usr/bin/env bash

# Profile-aware installer. Run from the repo root:
#   ./installer.sh [profile]      (profile defaults to "personal")

parent_path=$(pwd -P)
cd "$parent_path" || exit

# shellcheck source=lib/profile.sh
source ./lib/profile.sh
resolve_profile "$1" || exit 1

echo ""
echo "📦 Setup profile: ${PROFILE}"
echo "🔎 Scripts to run:"
while IFS= read -r script; do
  echo "  - ${script}"
done < <(read_list "profiles/${PROFILE}.txt")

echo ""
read -r -q "REPLY?Proceed with the '${PROFILE}' setup? (y/n) "
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
  export RUN_BY_INSTALLER=1
  echo "⚙️  Running scripts..."
  while IFS= read -r script; do
    echo ""
    echo "▶️  ${script}"
    # shellcheck source=/dev/null
    source "./${script}" "$PROFILE"
  done < <(read_list "profiles/${PROFILE}.txt")
fi
