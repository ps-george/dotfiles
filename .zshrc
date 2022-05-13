# ~/.zshrc: executed by zsh

# Load auto-completions
autoload -Uz compinit
compinit

export PATH=/usr/local/bin:$PATH

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# cross-shell history update
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Key bindings, up/down arrow searches through history
# Cycle through history based on characters already typed on the line
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
bindkey "${terminfo[kcud1]}" history-beginning-search-forward

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias back='cd $OLDPWD'
alias mkdir='mkdir -p -v'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# open vscode but activate the poetry venv first so linting works
alias vscode='poetry shell && code .'

# Enable 256 bit colours
alias tmux='tmux -2'
alias k='kubectl'
alias kx="kubectx"
alias activate='source ./venv/bin/activate'
alias pip='pip3'
alias note='vim ~/notes/general.md'
alias today='vim ~/notes/$(date +%Y-%m-%d).md'
alias yesterday='vim ~/notes/$(date -d yesterday +%Y-%m-%d).md'
alias pslist='ps aux | fzf'
alias gca='git diff --cached'
alias gco='git checkout'
alias gst='git status'
alias gu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gb='git branch | cut -c 3- | fzf | xargs git checkout'
alias githash='git rev-parse HEAD'
# from https://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches
# git fetch-pull
alias gf='git pull --all'
alias gp='git push'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Autocompletion downloded via: https://docs.docker.com/compose/completion/
# sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# Reload bash from ~/.bashrc
sbash () {
  source ~/.zshrc
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

# Enable automatic activation of virtualenvs using pyenv.
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

export PATH="/snap/bin:$HOME/.local/bin:$PATH"
export CLOUDSDK_PYTHON=/usr/bin/python
export VISUAL=vim
export EDITOR="$VISUAL"
export CLOUDSDK_PYTHON=/usr/bin/python2.7
export NVM_DIR="$HOME/.nvm"
# maybe required for black to run
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"
