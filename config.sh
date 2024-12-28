#######################################################################
# CONFIGURATIONS 
# ZSH settings.
#######################################################################

## History settings
HISTSIZE=999999
SAVEHIST=999999
HISTFILE=~/.zsh_history

## Basic Path
BASE_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
BASE_PATH="/usr/local/bin:/usr/local/sbin:$BASE_PATH"
BASE_PATH="/usr/games:/usr/local/games:$BASE_PATH"

## Important things
EXTENDED_PATH="$HOME/bin:$HOME/.local/bin"
EXTENDED_PATH="$HOME/.dotnet/tools:$EXTENDED_PATH"

# Ensure PATH has basic included once, plus the extended ones
TMP_PATH="$(echo "$PATH:$BASE_PATH" | tr ':' '\n' | sort | uniq | tr '\n' ':')"
export PATH="$EXTENDED_PATH:$TMP_PATH"
