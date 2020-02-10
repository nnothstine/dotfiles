export ZSH_BOOKMARKS="$XDG_DATA_HOME/zshbookmarks"
zinit lucid
zinit light 'MikeDacre/cdbk'

if ! __nan_has fzf; then
  # Binary release in archive, from GitHub-releases page.
  # After automatic unpacking it provides program "fzf".
  zinit lucid from'gh-r' as'program'
  zinit light junegunn/fzf-bin
fi

zinit lucid wait from'gh-r' as'program' mv'fd* -> fd' pick'fd/fd'
zinit light sharkdp/fd

# ----------------------------------------------------------------------------
# ZSH extensions
# ----------------------------------------------------------------------------

zinit lucid wait'[[ -n ${ZLAST_COMMANDS[(r)man*]} ]]'
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit lucid wait blockf atpull'zinit creinstall -q .'
zinit load 'zsh-users/zsh-completions'

if [[ -z $SSH_CONNECTION ]]; then
    # In-line best history match suggestion
    # don't suggest lines longer than
    export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=78
    # as of v4.0 use ZSH/zpty module to async retrieve
    #export ZSH_AUTOSUGGEST_USE_ASYNC=1
    # Removed forward-char
    export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    vi-end-of-line
    vi-add-eol
    )
    bindkey '^k' autosuggest-accept
    zinit lucid wait'1' atload'_zsh_autosuggest_start'
    zinit load 'zsh-users/zsh-autosuggestions'
    # TODO: Super slow with man pages right now; remove atload when fixed
    zinit lucid wait'1' atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay;" atload"unset 'FAST_HIGHLIGHT[chroma-whatis]' 'FAST_HIGHLIGHT[chroma-man]'"
    zinit load 'zdharma/fast-syntax-highlighting'
fi