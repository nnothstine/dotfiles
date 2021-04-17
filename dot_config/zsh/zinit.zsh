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

zinit for pick"async.zsh" atload"prompt_pure_setup" src"pure.zsh" \
  load 'sindresorhus/pure'

# zinit lucid wait'[[ -n ${ZLAST_COMMANDS[(r)man*]} ]]'
# zinit lucid trigger-load'!man'
zinit for lucid trigger-load'!man' is-snippet \
  "OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh"
# zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# zinit lucid wait blockf atpull'zinit creinstall -q .'
zinit for lucid wait blockf atpull'zinit creinstall -q .' \
  'zsh-users/zsh-completions'

if [[ -z $SSH_CONNECTION ]]; then
  # In-line best history match suggestion
  # don't suggest lines longer than
  export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=78
  # as of v4.0 use ZSH/zpty module to async retrieve
  export ZSH_AUTOSUGGEST_USE_ASYNC=1
  # Removed forward-char
  export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(vi-end-of-line)
  export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

  zinit lucid wait for \
    atload'_zsh_autosuggest_start && bindkey "^n" autosuggest-accept' \
    'zsh-users/zsh-autosuggestions' \
    \
    blockf atpull'zinit creinstall -q .' \
    'zsh-users/zsh-completions' \
    ;

   # don't add wait, messes with zsh-autosuggest
  zinit lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" for \
    'zdharma/fast-syntax-highlighting'
fi
