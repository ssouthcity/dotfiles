# Oh My Zsh plugins
# =================

export ZSH="$HOME/.oh-my-zsh"

VI_MODE_SET_CURSOR=true
ZSH_TMUX_AUTOSTART=true

plugins=(
  azure
  cabal
  catimg
  direnv
  docker
  fzf
  git
  golang
  kubectl
  nvm
  pyenv
  rust
  starship
  terraform
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
