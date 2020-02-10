
autoload -U zmv 

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias ln="${aliases[ln]:-ln} -v"  # verbose ln
alias l='ls -1'
alias ll='ls -l'
alias la='LC_COLLATE=C ls -la'

# notify me before clobbering files
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'
alias wget='wget -c'                # Resume dl if possible

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'

alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias rg='rg'

alias curl="curl --config '${DOTFILES}/shell/curl/curlrc'"

alias cdd="cd $DOTFILES"
alias dp="$DOTFILES/deploy"

alias t="tree -a --noreport --dirsfirst -I '.git|node_modules|bower_components|.DS_Store'"

alias ydl-aac='youtube-dl --extract-audio --audio-format aac'
alias ydl-m4a='youtube-dl --extract-audio --audio-format m4a'
