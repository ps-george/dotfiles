#!/bin/bash

# If gnome-colours-solarized doesn't exist, clone it to ~/gnome-colours-solarized
# create a bash profile called 'solarized'
# run gnome-colours-solarized/install.sh to install dircolours and a theme

cp -f .bashrc bash.tmp
cat .bash-powerline.sh >> bash.tmp
rm -rf ~/.vim
rm -rf ~/.config/nvim
rm -rf ~/.sshrc.d
rm -f ~/.tmux.conf
rm -f ~/.bashrc
rm -f ~/.sshrc

mkdir -p ~/.config/nvim
cp -v nvim/init.vim ~/.config/nvim

cp -r sshrc.d/vim ~/.vim
if [ $? -eq 0 ]; then
  echo "'sshrc.d/vim' -> '$HOME/.sshrc.d/.vim'"
fi
cp -r sshrc.d ~/.sshrc.d
if [ $? -eq 0 ]; then
  echo "'sshrc.d' -> '$HOME/.sshrc.d'"
fi
cp -v .tmux.conf ~/.tmux.conf
cp -v bash.tmp ~/.bashrc
cp -v bash.tmp ~/.sshrc
