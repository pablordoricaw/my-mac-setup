# My Mac Setup

These are the scripts that I use to setup and maintain my Mac forked from [Jason's repo](https://github.com/jsnmrs/dotfiles). 
> Thank you Jason!

As you can see, heavily depend on :beer: [Homebrew](brew.sh)

## Table of Contents

- [Step zero](#step-zero)
- [Getting started, using Git](#getting-started-using-git)
- [Install scripts](#install-scripts)
  - [Installing Homebrew, binaries, and applications](#installing-homebrew-binaries-and-applications)
  - [Configure macOS dock icons](#configure-macos-dock-icons)
- [Housekeeping](#housekeeping)
- [Inspiration](#heavily-inspired-by)

## Step zero

**On a new machine or fresh macOS install:** before you can do much on the command line (like using Git), Xcode Command Line Tools need to be installed and the license agreed to.

1. Open Applications > Utilites > Terminal
2. Install Xcode Command Line Tools `xcode-select --install`
3. Click install, agree to license

## Getting started, using Git

You can clone the repository wherever you want. I like to keep it in `~/Projects/dotfiles`.

```bash
git clone https://github.com/pablordoricaw/my-mac-setup.git && cd dotfiles
```

## Install scripts

### Installing Homebrew, binaries, and applications

The [homebrew/install.sh](https://github.com/jsnmrs/dotfiles/blob/main/homebrew/install.sh) script will:

1. Install (or update) Homebrew
2. Install a list of Homebrew formulae
3. Install a list of applications via Homebrew Cask

**Run it:** `source homebrew/install.sh`

### Configure macOS dock icons

The [macos/configure-dock.sh](https://github.com/jsnmrs/dotfiles/blob/main/macos/configure-dock.sh) script will clear and add specific application icons to the dock.

**Run it:** `source macos/configure-dock.sh`

## Housekeeping

- `brew doctor` - to check in case anything went wrong while using Hombrew.
- `brew list` – list installed Homebrew formulae, including casks

## Heavily inspired by

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
- [Paul Miller’s dotfiles repo](https://github.com/paulmillr/dotfiles)
- [Matt Brictson’s dotfiles repo](https://github.com/mattbrictson/dotfiles)
- [Stephan Judis’ dotfiles repo](https://github.com/stefanjudis/dotfiles/)
- [Change macOS user preferences via command line by Pawel Grzybek](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/)
