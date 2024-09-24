#!/usr/bin/env bash

platform=$(uname)

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

if [[ "$platform" != "Darwin" ]]; then
  echo "This script is only for MacOS"
  exit 1
fi

current=$(cd $(dirname "$0") && pwd)
echo "Current directory is $current"

# Create symlinks, backup existing files if they exist
function handleSymlink() {
  src=$1
  dest=$2

  echo "Establish fresh symlink for $src? [yN]"
  read backup
  if [[ "$backup" =~ ^[Yy]$ ]]; then
    # if src exists, copy to backups.ignored
    if [ -e "$dest" ]; then
      echo "Backing up existing symlinked dotfiles"
      mkdir -p "$current/backups.ignored"
      cp -r "$src" "$current/backups.ignored/$(basename "$src")"
      # also delete the dest
      if [ -e "$dest" ]; then
        # if dest is a directory, delete it
        if [ -d "$dest" ]; then
          rm -rf "$dest"
        else
          rm "$dest"
        fi
      fi
    fi

    #if dest doesn't exist, create it
    if [ ! -e "$dest" ]; then
      echo "Creating symlinked dotfiles"
      ln -s "$src" "$dest"
    fi
  fi
}

echo "Setting up Mac"
echo "Set up OSX? (Brew, Apps, Node, Terminal) [yN] "
read osx
if [[ "$osx" =~ ^[Yy]$ ]]; then
  sh "$current/macOs/init.sh"
  sh "$current/macOs/01-brew.sh"
  sh "$current/macOs/02-node.sh"
  sh "$current/macOs/03-terminal.sh"
fi

# VSCode Extensions
echo "Install VSCode Extensions? [yN] "
read vscode
if [[ "$vscode" =~ ^[Yy]$ ]]; then
  sh "$current/vscode/vscode.sh"
fi

## Symlinks
echo "Update symlinked dotfiles? [yN]"
read symlinks
if [[ "$symlinks" =~ ^[Yy]$ ]]; then
  handleSymlink "${current}/.config/alacritty" "${HOME}/.config/alacritty"
  handleSymlink "${current}/git/.gitignore_global" "${HOME}/.gitignore_global"
  handleSymlink "${current}/git/.gitconfig" "${HOME}/.gitconfig"
  handleSymlink "${current}/zsh/.zshrc" "${HOME}/.zshrc"
fi
