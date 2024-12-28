#!/bin/bash

echo "Installing Deps:"
sudo apt update
sudo apt install -y \
    autoconf build-essential cmake cowsay gfortran fortune-mod \
    libbz2-1.0 libbz2-dev libcurl3-dev libdb-dev libffi-dev \
    libgdbm-dev libgdbm6 libgmp-dev liblzma-dev liblzma5 \
    libncurses5-dev libpcre2-dev libreadline-dev libreadline6-dev \
    libssl-dev libyaml-dev neovim patch python3-dev ruby-build \
    tk tk-dev tklib uuid-dev xorg-dev zlib1g-dev zsh zsh-syntax-highlighting
echo "Done"

echo "Backuping old config files:"
BKPDIR="$HOME/.backup_rc_files/$(date +%Y%m%d-%H%M%S)"
cd "$HOME"
mkdir -p "$BKPDIR"
echo "Your old config files will be saved to $BKPDIR."
mv .zsh .zshrc .zsh_facilities .oh-my-zsh .bashrc .bash_profile .bash_facilities .profile .bashrc.d $BKPDIR 2> /dev/null
echo "Done"

echo "Cloning the solution repo and creating local links:"
git clone https://github.com/wesleyit/zsh_facilities.git ~/.zsh_facilities
mkdir "$HOME/.zsh_facilities/.zsh"
ln -s "$HOME/.zsh_facilities/.zsh" ~/
ln -s "$HOME/.zsh_facilities/.zshrc" ~/
ln -s "$HOME/.zsh_facilities/.profile" ~/
ln -s "$HOME/.zsh_facilities/starship.toml" ~/.config/
echo "Done"

echo "Defining ZSH as your default shell:"
sudo chsh -s /bin/zsh $(whoami)
echo "Done"

echo "Installing LazyGit:"
cd /tmp
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
lazygit --version
echo "Done"

echo "Installing ZSH Autosuggestions:"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
echo "Done"

echo "Installing ASDF Runtime Manager:"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
source "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
echo "Done"

echo "Installing some runtimes with ASDF:"
# Install things with ASDF
asdf plugin add python
#asdf plugin add ruby
asdf plugin add rust
asdf plugin add nodejs
#asdf plugin add golang
#asdf plugin add r
asdf install rust 1.83.0
asdf global rust 1.83.0
asdf install python 3.12.1
asdf global python 3.12.1
#asdf install ruby 3.3.6
#asdf global ruby 3.3.6
asdf install nodejs 22.12.0
asdf global nodejs 22.12.0
#asdf install golang 1.22.10
#asdf global golang 1.22.10
#asdf install r 4.4.2
#asdf global r 4.4.2
echo "Done"

echo "Installing modern shell tools (it may take some time, go pick a coffee):"
asdf reshim
rehash 2> /dev/null
cargo install bat exa fd-find procs du-dust starship ytop ripgrep
asdf reshim
rehash 2> /dev/null
echo "Done"

echo "Installing LunarVIM:"
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
echo "Done"

echo "Finished setup. Don't forget to configure Nerd Fonts on your terminal." 
cowsay "Reload your shell and enjoy! :-D"
