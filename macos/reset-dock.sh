function reset_dock {
  # reset macOS Dock to default settings
  
  # https://www.defaults-write.com/reset-mac-dock-default/
  defaults delete com.apple.dock; killall Dock
}

reset_dock