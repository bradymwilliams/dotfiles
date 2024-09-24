echo "installing homebrew"
# install homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "brew installing stuff"

# git, hub, lazygit: Git-Related CLI Tools
# tree: Directory Tree
# bat: cat files and display colorized output
# ffmpeg: download and convert videos
# starship: pretty git prompt
# volta: node version manager
# flyctl: fly.io cli
# fzf: fuzzy finder
brew install git hub tree bat ffmpeg starship volta lazygit flyctl fzf

echo "installing apps with brew --cask"
brew install --cask \
  raycast alacritty google-chrome visual-studio-code 1password cleanmymac \
  logi-options+ brave-browser quicklook-json font-hack-nerd-font spotify discord zoom rectangle
