#!/bin/bash
cp -f .bashrc bash.tmp
cat .bash-powerline.sh >> bash.tmp

rm -f ~/.vim
rm -f ~/.sshrc.d
rm -f ~/.tmux.conf
rm -f ~/.bashrc
rm -f ~/.sshrc

ln -srv sshrc.d/vim ~/.vim
ln -srv sshrc.d ~/.sshrc.d
ln -srv sshrc.d/.tmux.conf ~/.tmux.conf
ln -srv bash.tmp ~/.bashrc
ln -srv bash.tmp ~/.sshrc
