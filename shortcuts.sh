#######################################################################
# KEYBOARD SHORTCUTS
#######################################################################

## Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

## Using CTRL/SHIFT + Arrows to move
bindkey  "^[[1;2D"   beginning-of-line
bindkey  "^[[1;2C"   end-of-line
bindkey  "^[[1;5D"   backward-word
bindkey  "^[[1;5C"   forward-word
