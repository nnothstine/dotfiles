alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

alias l 'ls -l'

alias mkdir 'mkdir -p'

alias grep 'grep --color=auto'

alias ag "ag -p $XDG_CONFIG_HOME/ag/agignore"
alias rg 'rg'

alias cdd 'cd $DOTFILES'
alias dp 'zsh -c $DOTFILES/deploy'

alias sshkeygen "ssh-keygen -t rsa -b 4096 -C"

alias t "tree -a --noreport --dirsfirst -I '.git|node_modules|bower_components|.DS_Store'"

alias ydl-aac 'youtube-dl --extract-audio --audio-format aac'
alias ydl-m4a 'youtube-dl --extract-audio --audio-format m4a'
