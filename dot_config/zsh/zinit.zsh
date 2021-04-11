export ZSH_BOOKMARKS="$XDG_DATA_HOME/zshbookmarks"
# zinit lucid
# zinit light 'MikeDacre/cdbk'

# if ! __nan_has fzf; then
#   # Binary release in archive, from GitHub-releases page.
#   # After automatic unpacking it provides program "fzf".
#   zinit lucid from'gh-r' as'program'
#   zinit light junegunn/fzf-bin
# fi

# zinit lucid wait from'gh-r' as'program' mv'fd* -> fd' pick'fd/fd'
# zinit light sharkdp/fd

# ----------------------------------------------------------------------------
# ZSH extensions
# ----------------------------------------------------------------------------

# zinit lucid wait'[[ -n ${ZLAST_COMMANDS[(r)man*]} ]]'
# zinit lucid trigger-load'!man'
zinit for lucid trigger-load'!man' is-snippet \
  "OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh"
# zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# zinit lucid wait blockf atpull'zinit creinstall -q .'
zinit for lucid wait blockf atpull'zinit creinstall -q .' \
  'zsh-users/zsh-completions'

if [[ -z $SSH_CONNECTION ]]; then
  # TODO: Super slow with man pages right now; remove atload when fixed
  zinit for lucid wait atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay;" \
    atload"unset 'FAST_HIGHLIGHT[chroma-whatis]' 'FAST_HIGHLIGHT[chroma-man]'" \
    'zdharma/fast-syntax-highlighting'

  zinit for lucid wait atload'!_zsh_autosuggest_start' \
    'zsh-users/zsh-autosuggestions'
  export ZSH_AUTOSUGGEST_USE_ASYNC=1

  zinit for pick"async.zsh" atload"prompt_pure_setup" src"pure.zsh" \
    load 'sindresorhus/pure'
fi
