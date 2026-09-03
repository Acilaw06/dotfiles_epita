#!/bin/sh

dot_list="bashrc zshrc config emacs gitconfig gitignore jnewsrc mozilla msmtprc muttrc signature slrnrc ssh thunderbird vim vimrc Xdefaults nvim ulauncher polybar picom alacritty kitty"
packages_list='hyfetch nerd-fonts.fira-code neovim polybar ulauncher picom zsh zsh-autosuggestions zsh-syntax-highlighting kitty nerd-fonts.jetbrains-mono eza'

for package in $packages_list;
do
  nix profile install nixpkgs#$package
done;

for f in $dot_list; do
  rm -rf "$HOME/.$f"
  ln -s "$AFS_DIR/.confs/$f" "$HOME/.$f"
done

if which zsh; then
  export SHELL="$(which zsh)"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
polybar
