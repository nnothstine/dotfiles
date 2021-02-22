# alias ls="gls --color=auto --group-directories-first -N"
# macOS-specific; GNU ls doesn't support ACLs and macOS doesn't have getfacl
alias ls="ls -G"
alias le="ls -ale@"
alias la="ls -Al"
alias date=gdate

alias y=pbcopy
alias p=pbpaste

alias b=brew
alias bi='b install'
alias bu='b uninstall'
alias bs='b search'
alias bz='b uninstall --zap'

alias brci='b install --cask'
alias brcu='b uninstall --cask'
alias brcr='b reinstall --cask'
alias brcz='bz --cask'
alias bru='brew update && brew upgrade && brew cleanup'

alias log='/usr/bin/log'

alias reallylogout='sudo launchctl bootout gui/$(id -u $(whoami))'

# alias las="$HOME/Library/Application Support"
# alias rlas="/Library/Application Support"

# macOS has no `md5sum`, so use `md5` as a fallback
__nan_has md5sum || alias md5sum="md5"
# macOS has no `sha1sum`, so use `shasum` as a fallback
__nan_has sha1sum || alias sha1sum="shasum"
