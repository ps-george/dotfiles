#!/bin/bash
cp -f .bashrc bash.tmp
cat .bash-powerline.sh >> bash.tmp
HOME=~
rm -rf ~/.vim
rm -rf ~/.sshrc.d
rm -f ~/.tmux.conf
rm -f ~/.bashrc
rm -f ~/.sshrc

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
