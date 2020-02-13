alias ls="gls --color=auto --group-directories-first"
alias date=gdate

alias y=pbcopy
alias p=pbpaste

alias b=brew
alias bi='b install'
alias bu='b uninstall'
alias bs='b search'
alias bru='brew update && brew upgrade && brew cleanup'
alias brc='brew cask'

# TODO: Don't always assume a username of nnothstine
alias reallylogout='sudo launchctl bootout gui/$(id -u nnothstine)'

alias las="cd $HOME/Library/Application Support"
alias rlas="cd /Library/Application Support"

# macOS has no `md5sum`, so use `md5` as a fallback
__nan_has md5sum  || alias md5sum="md5"
# macOS has no `sha1sum`, so use `shasum` as a fallback
__nan_has sha1sum || alias sha1sum="shasum"