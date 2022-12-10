# My Mac Setup

These are the scripts that I use to setup and maintain my Mac forked from [Jason's repo](https://github.com/pablordoricaw/my-mac-setup). 
> Thank you Jason!

As you can see, heavily depend on :beer: [Homebrew](brew.sh)

## Table of Contents

- [Step zero](#step-zero)
- [Getting started, using Git](#getting-started-using-git)
- [Installation instructions](#installation-instructions)
  - [Installing Homebrew, binaries, and applications](#installing-homebrew-binaries-and-applications)
  - [Configure SSH Key for GitHub](#configure-ssh-key-for-github)
  - [Configure macOS dock icons](#configure-macos-dock-icons)
- [Uninstall instructions](#uninstall-instructions)
- [Housekeeping](#housekeeping)
- [To Do](#to-do)
- [Inspiration](#heavily-inspired-by)

## Step zero

**On a new machine or fresh macOS install:** before you can do much on the command line (like using Git), Xcode Command Line Tools need to be installed and the license agreed to.

1. Open Applications > Utilites > Terminal
2. Install Xcode Command Line Tools `xcode-select --install`
3. Click install, agree to license

## Getting started, using Git

You can clone the repository wherever you want. I like to keep it in `~/Documents/Projects/my-mac-setup`.

```bash
git clone https://github.com/pablordoricaw/my-mac-setup.git && cd my-mac-setup
```

## Installation instructions

### Installing Homebrew, binaries, and applications

The [homebrew/install.sh](https://github.com/pablordoricaw/my-mac-setup/blob/main/homebrew/install.sh) script will:

1. Install (or update) Homebrew
2. Install a list of Homebrew formulae
3. Install a list of applications via Homebrew Cask

**Run it:** `source homebrew/install.sh`

### Configure SSH Key for GitHub

**Pre-requisites**: Needs the [Github CLI `gh`](https://cli.github.com/) installed.

The [github/config-ssh-key.sh](https://github.com/pablordoricaw/my-mac-setup/blob/main/github/config-ssh-key.sh) script will generate a new SSH key and add it to your GitHub account.

**Run it:** `source github/config-ssh-key.sh`

### Configure macOS 

#### Configure Dotfiles

**Pre-requisites**: Needs `chezmoi` installed and SSH key setup in your GitHub account

The [dotfiles/config-dotfiles.sh](https://github.com/pablordoricaw/my-mac-setup/blob/main/dotfiles/config-dotfiles.sh) will use `chezmoi` to clone the [dotfiles repo](https://github.com/pablordoricaw/my-mac-dotfiles) and apply them.

**Run it:** `source dotfiles/config-dotfiles.sh`

#### Configure macOS dock icons

**Pre-requisites**: Needs the `.macos` file from the dotfiles.

The `~/.macos` file applied with `chezmoi` will config macOS.

**Run it:** `source ~/.macos`

#### Configure Dock icons

**Pre-requisites**: (Soft) Needs applications to be installed with 🍺 Homebrew.

The [macos/config-dock.sh](https://github.com/pablordoricaw/my-mac-setup/blob/main/macos/config-dock.sh) script will clear and add specific application icons to the dock.

**Run it:** `source macos/config-dock.sh`

## Uninstall instructions

It is possible to uninstall the packages and aplications as well as reset the configs.

Inside the folders there are scripts that start with `uninstall-` or `reset-`. Use these files to uninstall apps and/or packages and reset configs.

To execute the scripts use the `source` command followed by the path to the script.

**Important:** Be sure to check the pre-requisites section of the section in the installation instructions, as the same pre-requisites will apply to execute these scripts.

 > **Note:** If you're looking to uninstall all packages and applications and reset all configs consider looking into Apple's docs to [Erase your Mac and reset it to factory settings](https://support.apple.com/en-us/HT212749#:~:text=From%20the%20Apple%20menu%20%EF%A3%BF,Erase%20All%20Content%20and%20Settings.)

## Housekeeping

- `brew doctor` - to check in case anything went wrong while using Hombrew.
- `brew list` – list installed Homebrew formulae, including casks

## To Do

This list contains things that I want this repo to setup in my Mac that I haven't done so far
- [ ] Install the [ToothFairy application](https://c-command.com/toothfairy/)
- [ ] Install the [Unsplash Wallpapers application](https://apps.apple.com/us/app/unsplash-wallpapers/id1284863847?mt=12)

This list contains ideas to improve this repo
- [ ] End-to-end setup of Mac with one command

## Heavily inspired by

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
- [Paul Miller’s dotfiles repo](https://github.com/paulmillr/dotfiles)
- [Matt Brictson’s dotfiles repo](https://github.com/mattbrictson/dotfiles)
- [Stephan Judis’ dotfiles repo](https://github.com/stefanjudis/dotfiles/)
- [Change macOS user preferences via command line by Pawel Grzybek](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/)
