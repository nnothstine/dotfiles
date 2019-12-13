__load_repo zdharma/zplugin $ZPLUGINDIR zplugin.zsh

if __nan_has zplugin; then
    zplugin lucid wait'[[ -n ${ZLAST_COMMANDS[(r)man*]} ]]'
    zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

    if [[ -z $SSH_CONNECTION ]]; then
        # TODO: Super slow with man pages right now; remove atload when fixed
        zplugin lucid wait'1' atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay;" atload"unset 'FAST_HIGHLIGHT[chroma-whatis]' 'FAST_HIGHLIGHT[chroma-man]'"
        zplugin load 'zdharma/fast-syntax-highlighting'
    fi
fi


source "$DOTFILES/shell/zsh/prompt.zsh"
source "$DOTFILES/shell/zsh/config.zsh"
source "$DOTFILES/shell/zsh/completion.zsh"
source "$DOTFILES/shell/zsh/keybindings.zsh"

autoload -Uz compinit
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Requires EXTENDED_GLOB=true; run compinit once every 24 hours, not on demand
if [[ -n "$ZSH_CACHE/zcompdump"(#qN.mh+24) ]]; then
    compinit -i -d $ZSH_CACHE/zcompdump
else
    compinit -C -d $ZSH_CACHE/zcompdump
fi

__nan_load_all aliases.zsh