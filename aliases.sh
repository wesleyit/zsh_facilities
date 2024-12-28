#######################################################################
# ALIASES
# Here you can define your default options for commands, or even
# create your own commands using zsh aliases
#######################################################################

## Reload configurations
alias reload="source ~/.zshrc"

## Edit ZSH main file
alias editzshrc="vim ~/.zshrc"

## Edit ZSH main folder
alias editzsh="vim ~/.zsh_facilities"

## List files using exa
alias ls="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"

## LunarVim
alias vim="lvim"

## Open command like in Mac OS X
alias open='xdg-open'

## Safe move and copy commands
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

## Git aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%an %cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gd='git diff'
alias gaa='git add --all'
alias gcmv='git commit'
alias gcmi='git commit -m'

## Cat with color and syntax highlight
alias ccat='bat'

## Better Docker management
alias docker-rma='docker rm -f $(docker ps -aq)' 
