# .dotfiles 
Personal configuration files that I use for development, includes configs for Neovim, kitty, TMUX.

### Install
1) Clone the repository into your home directory:
`cd ~ && git clone git@github.com:prozod/.dotfiles.git`
2) Run sync.sh: `cd .dotfiles && chmod u+x ./sync.sh && ./sync.sh` which will stash current changes if there are any then pull from the remote, pop the stash and symlink accordingly (using GNU stow).

README to be updated with more details.
