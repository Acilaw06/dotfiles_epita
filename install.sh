#!/bin/sh

dot_list="bashrc config emacs gitconfig gitignore jnewsrc mozilla msmtprc muttrc signature slrnrc ssh thunderbird vim vimrc Xdefaults nvim ulauncher polybar picom"
packages_list='hyfetch nerd-fonts oh-my-zsh neovim polybar ulauncher picom'

for package in $packages_list;
do
  nix profile install nixpkgs#$package
done;

for f in $dot_list; do
  rm -rf "$HOME/.$f"
  ln -s "$AFS_DIR/.confs/$f" "$HOME/.$f"
done

polybar
