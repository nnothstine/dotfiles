# disable global zsh config; we'll handle it ourselves
unsetopt GLOBAL_RCS

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"