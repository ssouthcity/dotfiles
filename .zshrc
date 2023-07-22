# Theme
# =====
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.p10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Terminal Behaviour
# ==================
setopt autocd
setopt correct

# Custom Commands
# ===============
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Golang
# ======
export PATH=$PATH:/usr/local/go/bin
