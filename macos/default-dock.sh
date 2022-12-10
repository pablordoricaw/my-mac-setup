function reset_dock {
  # reset macOS Dock to default settings

  defaults write com.apple.dock; killall Dock
}

reset_dock