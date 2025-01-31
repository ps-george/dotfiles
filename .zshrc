# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc: executed by zsh
# Load auto-completions
autoload -Uz compinit
compinit

# emacs bindings for terminal
export VISUAL=vim
export EDITOR="$VISUAL"
bindkey -e

export PATH=/usr/local/bin:$PATH
export PATH="/snap/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
# add homebrew to path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up x86_64 homebrew and pyenv and temporarily set aliases
alias brew86="arch -x86_64 /usr/local/bin/brew"
alias pyenv86="arch -x86_64 pyenv"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# clears clipboard
alias x='echo "x" | pbcopy'
alias back='cd $OLDPWD'
alias mkdir='mkdir -p -v'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Make and delete pyenvs
function makenv() {
	folder_name=${PWD##*/}
	if [ -z "$2" ]; then
          folder_name=$2
        fi
	if [ -z "$1" ]; then
	  echo "pyenv virtualenv <version> $folder_name"
	  echo "or: makenv 3.8"
	else
	  echo "pyenv virtualenv $1 $folder_name"
	  pyenv virtualenv "$1" "$folder_name"
	fi
}

function delenv() {
	folder_name=${PWD##*/}
	target_dir="$(eval echo "~/.pyenv/versions/${folder_name}")"
	if [ ! -L "${target_dir}" ]; then
		echo "${target_dir} does not exist"
		return
	fi
	to_remove=( $(find ~/.pyenv/versions -path "*/envs/*" -type d -name "${PWD##*/}") )
	for dir in "${to_remove[@]}"; do
	    echo -n "Do you want to delete the directory '$dir'? [y/N] "
	    read choice
	    case "$choice" in
		[yY]|[yY][eE][sS])
		    rm -rf "$dir"
		    echo "Directory '$dir' deleted."
		    ;;
		*)
		    echo "Skipping deletion of directory '$dir'."
		    ;;
	    esac
	done
	rm "${target_dir}"
}

# Enable 256 bit colours
alias tmux='tmux -2'
alias k='kubectl'
alias kx="kubectx"
# alias activate='source ./venv/bin/activate'
alias uuidgen='uuidgen | tr A-F a-f'
alias mkenv='pyenv virtualenv ${PWD##*/}'
alias activate='pyenv activate ${PWD##*/}'
alias deactivate='pyenv deactivate'
alias pip='pip3'
alias note='vim ./general.md'
alias today='vim ./$(date +%Y-%m-%d).md'
alias yesterday='vim ~/notes/$(date -d yesterday +%Y-%m-%d).md'
alias pslist='ps aux | fzf'
alias gca='git diff --cached'
alias gco='git checkout -b'
alias gst='git status'
alias gu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gb='git branch | cut -c 3- | fzf | xargs git checkout'
alias githash='git rev-parse HEAD'
# from https://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches
# git fetch-pull
alias gf='git pull --all'
alias gp='git push'
# alias vim="nvim"
alias db-forward='kubectl port-forward svc/pgbouncer2 54321:5432'
alias db-connect='export PGPASSWORD=$(op item get --fields password 3syfsj2bsxbssatnquue2vhhy4) && psql -h localhost --user ometria --port 54321 ometria_ecomm'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Autocompletion downloded via: https://docs.docker.com/compose/completion/
# sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# Reload bash from ~/.bashrc
sbash () {
  source ~/.zshrc
}

# Edit bash from ~/.bashrc
ebash () {
  vim ~/.zshrc
}

kcurl () {
  kubectl run -it --restart='Never' kcurlify --rm --image=curlimages/curl --command -- curl --connect-timeout 5 $@
}

k-multilog () {
    k get po  | ag "$1" | cut -d ' ' -f1 | xargs -I {} sh -c 'echo "{}"; kubectl logs "{}" | tail -n 5;'
}

k-get-errored () {
    if [ -z "$1"]
    then
        k get po | ag error
    else
        k get po | ag error | ag "$1"
    fi
}

k-delete-errored () {
  if [ ${#1} -lt 4 ] ; then
    echo "please input an argument longer than 4 characters"
    k get po | ag error | ag "$1"
    exit 1
  else
    k get po  | ag error | ag "$1" | cut -d ' ' -f1 | xargs -I {} kubectl delete pods "{}"
  fi
}

# List biggest files * sizes
files () {
  du -sch .[!.]* * | sort -hr | head -10
}

# Git pull in all subdirectories (in parallel)
pull () {
  ls | xargs -P10 -I{} git -C {} pull
}

# Easy extract
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# highlight log file when using tail
awkcol () {
  echo "{print \"\\033[$1m\" \$0 \"\\033[39m\"}"
}

ctail () {
  BLACK="$(awkcol 30)"
  RED="$(awkcol 31)"
  GREEN="$(awkcol 32)"
  YELLOW="$(awkcol 33)"
  BLUE="$(awkcol 34)"
  MAGENTA="$(awkcol 35)"
  CYAN="$(awkcol 36)"
  tail "$@" \
  | awk "
    /NOTSET/ $MAGENTA
    /DEBUG/ $MAGENTA
    /INFO/ $BLUE
    /WARNING/ $YELLOW
    /ERROR/ $RED
    /CRITICAL/ $RED
  "
}

tmuxrc () {
  local TMUXDIR=/tmp/footmuxserver
  if ! [ -d $TMUXDIR ]; then
    rm -rf $TMUXDIR
    mkdir -p $TMUXDIR
  fi
    rm -rf $TMUXDIR/.sshrc.d
    cp -r $SSHHOME/.sshrc $SSHHOME/bashsshrc $SSHHOME/sshrc $SSHHOME/.sshrc.d $TMUXDIR
    SSHHOME=$TMUXDIR SHELL=$TMUXDIR/bashsshrc /usr/bin/tmux -S $TMUXDIR/tmuxserver $@
}

source <(kubectl completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

#
# maybe required for black to run
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Google cloud
export CLOUDSDK_PYTHON=$(which python3)
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# 1password autocompletion
eval "$(op completion zsh)"; compdef _op op
# direnv setup
# https://github.com/concrete-utopia/utopia#using-direnv-to-make-your-life-easier
eval "$(direnv hook zsh)"

# asdf (https://asdf-vm.com/)
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
. "$HOME/.asdf/asdf.sh"
# . "$HOME/.asdf/completions/asdf.bash"

export PATH="${PATH}:/Users/georgepunter/repos/ometria.tools/bin"

# login to docker using op

dockerlogin () {
  docker login -u="$(eval "op item get --fields username 76nqhtqftnl3mbnzzlmqttpqki")" -p="$(eval "op item get --fields credential 76nqhtqftnl3mbnzzlmqttpqki")"
}

export GOSS_PATH=/usr/local/bin/goss-linux-amd64
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

. "$HOME/.atuin/bin/env"

unsetopt SHARE_HISTORY
eval "$(atuin init zsh)"
