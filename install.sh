#!/bin/bash

echo "Installing Deps:"
sudo apt install -y zsh git curl fortune-mod cowsay vim-nox
echo "Done"

echo "Backuping old config files:"
BKPDIR="$HOME/.backup_rc_files/$(date +%Y%m%d-%H%M%S)"
cd "$HOME"
mkdir -p "$BKPDIR"
echo "Your old config files will be saved to $BKPDIR."
mv .zshrc .zsh_facilities .oh-my-zsh .bashrc .bash_profile .profile .bashrc.d $BKPDIR 2> /dev/null
echo "Done"

echo "Clonning the solution repo and creating local links:"
git clone https://github.com/wesleyit/zsh_facilities.git .zsh_facilities
ln -s "$HOME/.zsh_facilities/.zshrc" ~/
ln -s "$HOME/.zsh_facilities/.profile" ~/
ln -s "$HOME/.zsh_facilities/.oh-my-zsh" ~/
echo "Done"

echo "Installing the fonts:"
mkdir -p "$HOME/.fonts"
ln -s "$HOME/.zsh_facilities/fonts" "$HOME/.fonts/"
sudo fc-cache || true
echo "Done"

echo "Defining ZSH as your default shell"
sudo chsh -s /bin/zsh $(whoami)
echo "Done"

echo "Finished setup. Please, reload your shell and enjoy! :-D"
