# My Mac Setup

These are the scripts that I use to setup and maintain my Mac forked from [Jason's repo](https://github.com/pablordoricaw/my-mac-setup).
> Thank you Jason!

As you can see, heavily depend on :beer: [Homebrew](brew.sh)

## Table of Contents

- [My Mac Setup](#my-mac-setup)
  - [Table of Contents](#table-of-contents)
  - [Step zero](#step-zero)
  - [Getting started, using Git](#getting-started-using-git)
  - [Installation instructions](#installation-instructions)
    - [Installing Homebrew, binaries, and applications](#installing-homebrew-binaries-and-applications)
    - [Configure SSH Key for GitHub](#configure-ssh-key-for-github)
    - [Configure macOS](#configure-macos)
      - [Configure Dotfiles](#configure-dotfiles)
      - [Configure macOS dock icons](#configure-macos-dock-icons)
      - [Configure Dock icons](#configure-dock-icons)
  - [Install App Store Applications](#install-app-store-applications)
  - [Install Other non-Homebrew or App Store applications, packages, etc](#install-other-non-homebrew-or-app-store-applications-packages-etc)
  - [Update Instructions](#update-instructions)
    - [Update packages installed with Homebrew](#update-packages-installed-with-homebrew)
    - [Update Applications installed with Homebrew](#update-applications-installed-with-homebrew)
    - [Update Applications installed with `mas`](#update-applications-installed-with-mas)
  - [Uninstall instructions](#uninstall-instructions)
  - [Housekeeping](#housekeeping)
  - [To Do](#to-do)
  - [Heavily inspired by](#heavily-inspired-by)

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

The [`homebrew/install.sh`](https://github.com/pablordoricaw/my-mac-setup/blob/main/homebrew/install.sh) script will:

1. Install (or update) Homebrew
2. Install a list of Homebrew formulae
3. Install a list of applications via Homebrew Cask

**Run it:** `source ./homebrew/install.sh`

### Configure SSH Key for GitHub

**Pre-requisites**: Needs the [Github CLI `gh`](https://cli.github.com/) installed.

The [`github/config-ssh-key.sh`](https://github.com/pablordoricaw/my-mac-setup/blob/main/github/config-ssh-key.sh) script will generate a new SSH key and add it to your GitHub account.

**Run it:** `source ./github/config-ssh-key.sh`

### Configure macOS

#### Configure Dotfiles

**Pre-requisites**: Needs `chezmoi` installed and SSH key setup in your GitHub account

The [`dotfiles/config-dotfiles.sh`](https://github.com/pablordoricaw/my-mac-setup/blob/main/dotfiles/config-dotfiles.sh) will use `chezmoi` to clone the [dotfiles repo](https://github.com/pablordoricaw/my-macos-dotfiles) and apply them.

**Run it:** `source ./dotfiles/config-dotfiles.sh`

#### Configure macOS dock icons

**Pre-requisites**: Needs the `.macos` file from the dotfiles.

The `~/.macos` file applied with `chezmoi` will config macOS.

**Run it:** `source ~/.macos`

#### Configure Dock icons

**Pre-requisites**: (Soft) Needs applications to be installed with 🍺 Homebrew.

The [`macos/config-dock.sh`](https://github.com/pablordoricaw/my-mac-setup/blob/main/macos/config-dock.sh) script will clear and add specific application icons to the dock.

**Run it:** `source ./macos/config-dock.sh`

## Install App Store Applications

**Pre-requisites**:

1. Sign in manually into the App Store.
2. Needs [`mas`](https://github.com/mas-cli/mas) installed. It is installed with 🍺 Homebrew

The [`macos/install-apps.sh`](https://github.com/pablordoricaw/my-mac-setup/blob/main/macos/install-apps.sh) script will install the App Store applications. It uses the `mas` CLI to do so.

> To add more apps to be installed refer to the [Usage section of the README](https://github.com/mas-cli/mas#-usage) of `mas`

**Run it:** `source ./macos/install.sh`

## Install Other non-Homebrew or App Store applications, packages, etc

Check the individual requirements. For example, Docker requires the Docker Installer to be downloaded from [www.docker.com](www.docker.com).

**Run it:** `source ./other/install.sh`

## Update Instructions

The following section contains instructions to update all the installed binaries and applications with 🍺 Homebrew and `mas`.

### Update packages installed with Homebrew

Follow the instructions outlined in the [How do I update my local packages?](https://docs.brew.sh/FAQ#how-do-i-update-my-local-packages) section in the [FAQ](https://docs.brew.sh/FAQ) page of Homebrew 🍺.

### Update Applications installed with Homebrew

1. Close all applications installed with Homebrew.
2. Open the Terminal app
3. Run the following command to update all applications installed with Homebrew:
   ```brew upgrade --cask```
4. Once, applications are updated, run the `macos/config-doc.sh` script.

**Note:** For more details on the `brew upgrade --cask` command refer to the answer by **scribblemaniac** to the [Upgrade all the casks installed via Homebrew Cask](https://stackoverflow.com/questions/31968664/upgrade-all-the-casks-installed-via-homebrew-cask) in StackOverflow.

### Update Applications installed with `mas`

1. Run the `macos/install-apps.sh` script to update all applications installed with `mas`.

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

- [x] Install the [ToothFairy application](https://c-command.com/toothfairy/)
- [x] Install the [Unsplash Wallpapers application](https://apps.apple.com/us/app/unsplash-wallpapers/id1284863847?mt=12)
- [x] Install the [Things 3](https://apps.apple.com/us/app/things-3/id904237743)

This list contains ideas to improve this repo

- [ ] Install Command Line Tools during installation
```bash
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
```
- [ ] End-to-end setup of Mac with one command
- [ ] Include dependencies between the setup steps.
  - [ ] A step always runs after the step(s) it depends on.
  - [ ] A step doesn't run and alerts if a *parent* step didn't complete successfully

## Heavily inspired by

The following list contains the inspirations for Jason repository from when I forked his repository.

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
- [Paul Miller’s dotfiles repo](https://github.com/paulmillr/dotfiles)
- [Matt Brictson’s dotfiles repo](https://github.com/mattbrictson/dotfiles)
- [Stephan Judis’ dotfiles repo](https://github.com/stefanjudis/dotfiles/)
- [Change macOS user preferences via command line by Pawel Grzybek](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/)
