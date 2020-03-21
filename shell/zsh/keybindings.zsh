bindkey -v
# Open current prompt in external editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^ ' edit-command-line

# bindkey -M viins '^n' history-substring-search-down # ctrl-n
# bindkey -M viins '^p' history-substring-search-up
# bindkey -M viins '^s' history-incremental-pattern-search-backward
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^b' backward-word
bindkey -M viins '^f' forward-word
bindkey -M viins '^g' push-line-or-edit
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^d' push-line-or-edit
bindkey -M vicmd '^k' kill-line
bindkey -M vicmd 'H' run-help
# Shift + Tab
bindkey -M viins '^[[Z' reverse-menu-complete
# bind UP and DOWN arrow keys
# bindkey '^[[A' history-substring-search-up # up arrow
# bindkey '^[[B' history-substring-search-down # down arrow
