__load_repo zdharma/zplugin $ZPLUGINDIR zplugin.zsh

if __nan_has zplugin; then
    zplugin lucid wait'[[ -n ${ZLAST_COMMANDS[(r)man*]} ]]'
    zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

    zplugin lucid wait'1' atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
    # export FAST_HIGHLIGHT[whatis_chroma_type]=0
    zplugin load 'zdharma/fast-syntax-highlighting'
    # TOOD: Super slow with man pages right now
fi

source "$DOTFILES/shell/zsh/prompt.zsh"
source "$DOTFILES/shell/zsh/config.zsh"
source "$DOTFILES/shell/zsh/completion.zsh"
source "$DOTFILES/shell/zsh/keybindings.zsh"

autoload -Uz compinit
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
compinit -d $ZSH_CACHE/zcompdump
__nan_load_all aliases.zsh