#!/usr/bin/env bash

# Force-installs browser extensions via each browser's managed-policy mechanism.
# Only runs for a browser that is actually installed. Extensions are read from
# the common + per-profile lists in this directory and take effect on next launch.

# shellcheck source=lib/profile.sh
source ./lib/profile.sh
resolve_profile "$1" || exit 1

echo -e "\\n⬇️  Configuring browser extensions for profile '${PROFILE}'"

###          ###
#   CHROME     #
###          ###
chrome_app="/Applications/Google Chrome.app"
chrome_update_url="https://clients2.google.com/service/update2/crx"

if [ -d "$chrome_app" ]; then
  forcelist=()
  while IFS= read -r ext_id; do
    forcelist+=("${ext_id};${chrome_update_url}")
  done < <(read_list browsers/chrome.common; read_list "browsers/chrome.${PROFILE}")

  if [ "${#forcelist[@]}" -gt 0 ]; then
    # Replaces the managed force-install list (idempotent across re-runs).
    defaults write com.google.Chrome ExtensionInstallForcelist -array "${forcelist[@]}"
    echo "⭐ Chrome: force-installed ${#forcelist[@]} extension(s). Restart Chrome to apply."
  else
    echo "ℹ️  Chrome: no extensions listed, nothing to do."
  fi
else
  echo "⏭️  Chrome not installed, skipping."
fi

###          ###
#   FIREFOX    #
###          ###
firefox_app="/Applications/Firefox.app"
firefox_policies="${firefox_app}/Contents/Resources/distribution/policies.json"

if [ -d "$firefox_app" ]; then
  ext_json=""
  sep=""
  count=0
  while IFS= read -r line; do
    addon_id="${line%%[[:space:]]*}"
    slug="${line##*[[:space:]]}"
    xpi_url="https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi"
    ext_json+="${sep}      \"${addon_id}\": { \"installation_mode\": \"force_installed\", \"install_url\": \"${xpi_url}\" }"
    sep=$',\n'
    count=$((count + 1))
  done < <(read_list browsers/firefox.common; read_list "browsers/firefox.${PROFILE}")

  if [ "$count" -gt 0 ]; then
    policies_json="{
  \"policies\": {
    \"ExtensionSettings\": {
${ext_json}
    }
  }
}"
    policies_dir="$(dirname "$firefox_policies")"
    if mkdir -p "$policies_dir" 2>/dev/null && printf '%s\n' "$policies_json" > "$firefox_policies" 2>/dev/null; then
      echo "⭐ Firefox: force-installed ${count} add-on(s). Restart Firefox to apply."
    else
      echo "🔐 Firefox: elevated permissions needed to write the policy file..."
      sudo mkdir -p "$policies_dir"
      printf '%s\n' "$policies_json" | sudo tee "$firefox_policies" >/dev/null
      echo "⭐ Firefox: force-installed ${count} add-on(s). Restart Firefox to apply."
    fi
  else
    echo "ℹ️  Firefox: no add-ons listed, nothing to do."
  fi
else
  echo "⏭️  Firefox not installed, skipping."
fi
