#!/usr/bin/env bash

# Shared helpers for profile-aware setup scripts.
# IMPORTANT: run scripts from the repo root so the relative paths below resolve.

resolve_profile() {
  # Pick the active profile: explicit arg > $PROFILE env > default "personal".
  # Validates that a matching manifest exists; exports PROFILE on success.
  # Usage: resolve_profile "$1"
  local requested="${1:-${PROFILE:-personal}}"

  if [ ! -f "profiles/${requested}.txt" ]; then
    echo "❌ Unknown profile '${requested}'." >&2
    echo "   Valid profiles:" >&2
    local manifest name
    for manifest in profiles/*.txt; do
      [ -e "$manifest" ] || continue
      name="$(basename "$manifest" .txt)"
      echo "   - ${name}" >&2
    done
    return 1
  fi

  export PROFILE="$requested"
}

read_list() {
  # Echo installable items from a list file, one per line.
  # Skips blank lines and "#" comments (whole-line and inline).
  # A missing file is not an error: the profile simply has no items here.
  # Usage: read_list path/to/file
  local file="$1"
  [ -f "$file" ] || return 0

  local line
  while IFS= read -r line || [ -n "$line" ]; do
    # strip inline comments
    line="${line%%#*}"
    # trim leading whitespace
    line="${line#"${line%%[![:space:]]*}"}"
    # trim trailing whitespace
    line="${line%"${line##*[![:space:]]}"}"
    [ -n "$line" ] && printf '%s\n' "$line"
  done < "$file"
}
