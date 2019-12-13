# disable global zsh config; we'll handle it ourselves
unsetopt GLOBAL_RCS

# TODO: make this more generic – how to fix the 0:A:h for this dir?
source "$HOME/.dotfiles/env"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINDIR="$ZDOTDIR/zplugin"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"

typeset -gU cdpath fpath mailpath path
path=( $XDG_BIN_HOME $DOTFILES/bin $DOTFILES_DATA/*.topic/bin(N) $path )
fpath=( $ZDOTDIR/functions $XDG_BIN_HOME $fpath )

export LANG=${LANG:-en_US.UTF-8}
export PAGER=less
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"

__nan_load_all env.zsh