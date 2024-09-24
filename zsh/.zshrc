plugins=(git)

export VOLTA_HOME="$HOME/.volta"
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-completions z history)

# Path Alterations
PATH="/usr/local/bin:$PATH"

PATH="$VOLTA_HOME/bin:$PATH"
## node_modules 😆 this is *way* faster than using "npm prefix" and it works fine.
PATH="$PATH:./node_modules/.bin:../node_modules/.bin:../../node_modules/.bin:../../../node_modules/.bin:../../../../node_modules/.bin:../../../../../node_modules/.bin:../../../../../../node_modules/.bin:../../../../../../../node_modules/.bin"
export PATH

alias git="hub"

source <(fzf --zsh)
eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
