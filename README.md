# dotfiles
For dotfile configurations

```bash
ln -s ~/dotfiles/sshrc.d/vim ~/.vim
ln -s ~/dotfiles/sshrc.d ~/.sshrc.d
ln -s ~/dotfiles/sshrc.d/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.sshrc ~/.sshrc
```

## Install Plugged for nvim

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Install powerline for tmux
```bash
pip install powerline-status
pip show powerline-status # shows location of powerline install
# add this line to .tmux.conf
source /usr/local/lib/python2.7/dist-packages/powerline/bindings/tmux/powerline.conf
```
### Install powerline fonts
```bash
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
# move the symbol font to a valid X font path
mkdir ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

## Install sshrc

https://github.com/Russell91/sshrc

```bash
sudo add-apt-repository ppa:russell-s-stewart/ppa
sudo apt-get update
sudo apt-get install sshrc
```

## Install solarized colours
`git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git`
