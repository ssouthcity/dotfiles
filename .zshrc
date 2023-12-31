# Golang
# ======

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

# Oh My Zsh plugins
# =================

export ZSH="$HOME/.oh-my-zsh"

VI_MODE_SET_CURSOR=true
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_FIXTERM=false

plugins=(
  fzf
  git
  golang
  nvm
  pyenv
  starship
  tmux
  vi-mode
  web-search
)

source $ZSH/oh-my-zsh.sh

# Terminal Behaviour
# ==================

export LANG="en_US.UTF-8"
export EDITOR="nvim"

# Aliases and Commands
# ====================

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
