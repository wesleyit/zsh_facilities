# ZSH Folders and Options
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="wes"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
plugins=( adb command-not-found docker emoji pip virtualenv )
SHOW_AWS_PROMPT=false
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# ZSH Facilities
source ~/.zsh_facilities/01_aliases.sh
source ~/.zsh_facilities/02_functions.sh
source ~/.zsh_facilities/03_variables.sh
source ~/.zsh_facilities/04_configs.sh
source ~/.zsh_facilities/scripts.d/98_fortunes.sh
