#!/bin/bash
#
#################################################
# THIS IS ONLY FOR THE MAC OSX SETUP, NOT LINUX #
#################################################

# Install xcode command-line tools
xcode-select --install

# Install shell formatter
curl -sS https://webinstall.dev/shfmt | bash # shfmt (works with null-ls too!)

# Make sure we’re using the latest Homebrew
brew update
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Install more recent versions of some OS X tools
brew install stow
brew install neovim
brew install ripgrep
brew install --cask kitty
brew install tmux
brew install tree-sitter

# Node version manager
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Install other useful binaries
brew install ffmpeg --with-libvpx
brew install fzf
brew install git
brew install gnupg
brew install imagemagick --with-webp
brew install rename
brew install the_silver_searcher
brew install awscli
brew install gh
brew install openssl

# Oh My Zsh + Powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# language servers
brew install cppcheck
brew install clangd
brew install golangci-lint
brew install black
brew install flake8

# Remove outdated versions from the cellar
brew cleanup

SCRIPT_DIR="$(dirname -- "$(readlink -f -- "$0")")"
cat SCRIPT_DIR/aliases.txt | tee -a ~/.zshrc
