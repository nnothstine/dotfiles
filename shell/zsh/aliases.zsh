
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

alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias rg='rg'

alias log='/usr/bin/log'
alias cdd="cd $DOTFILES"