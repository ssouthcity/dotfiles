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
alias ls="ls --color=auto"
alias ll="ls -alF"
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
function take () { mkdir $1 && cd $1; }

# Golang
# ======
export PATH="$PATH:/usr/local/go/bin"

# Python
# ======
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Tmux
# ====
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 2>&1
fi
