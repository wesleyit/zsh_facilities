#######################################################################
# PROMPT 
# Settings related to the prompt look and feel.
#######################################################################

## Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## Starfish Prompt
eval "$(starship init zsh)"

## Syntax highlight in shell
# It is recommended to use this plugin as the last one from the
# entire zsh configuration!
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## This script will show neofetch or funny messages depending on the
# time. Root will always see neofetch.
FORTUNE_DIR="$HOME/.zsh_facilities/fortunes"
FORTUNE_COOKIE="$(date +%S)"
if [[ "$UID" -eq 0 -o "$FORTUNE_COOKIE" -lt "20" ]]
then 
    neofetch
elif [[ "$FORTUNE_COOKIE" -lt "40" ]]
then
    fortune "$FORTUNE_DIR" | cowsay -W 80
else
    fortune "$FORTUNE_DIR/off"
fi
echo -ne "\n"
