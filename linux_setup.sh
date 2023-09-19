#!/bin/sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install stuff
apt-get update  
apt-get install flatpak -y
apt-get install git-all -y
apt-get install i3blocks -y
apt-get install ripgrep -y
apt-get install fd-find -y
apt-get install imagemagick -y
apt-get install -y xsel
apt-get install tmux
apt-get install curl
apt-get install stow

#hit prefix+I to install TMUX plugins after setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use lts
# nvm alias default 9.3.0

flatpak install --noninteractive -y flathub com.discordapp.Discord
sudo ln -s /var/lib/flatpak/exports/bin/com.discordapp.Discord /usr/bin/discord

flatpak install --noninteractive -y flathub com.spotify.Client
sudo ln -s /var/lib/flatpak/exports/bin/com.spotify.Client /usr/bin/spotify

flatpak install --noninteractive -y flathub org.gimp.GIMP
sudo ln -s /var/lib/flatpak/exports/bin/org.gimp.GIMP /usr/bin/gimp

flatpak install --noninteractive -y flathub org.gimp.GIMP
sudo ln -s /var/lib/flatpak/exports/bin/org.gimp.GIMP /usr/bin/gimp

flatpak install --noninteractive -y flathub com.visualstudio.code
sudo ln -s /var/lib/flatpak/exports/bin/com.visualstudio.code /usr/bin/vscode

flatpak install --noninteractive -y flathub com.visualstudio.code
sudo ln -s /var/lib/flatpak/exports/bin/com.visualstudio.code /usr/bin/vscode

flatpak install --noninteractive -y flathub com.google.Chrome
sudo ln -s /var/lib/flatpak/exports/bin/com.google.Chrome /usr/bin/chrome

sudo apt-get clean

# Oh My Zsh + Powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


