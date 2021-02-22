export GNUPGHOME="$XDG_CONFIG_HOME/gpg"

export LESS='-g -i -M -R -S -w -z-4'
export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_AUTO_UPDATE_SECS=86400

path=( /opt/brew/bin /usr/local/{s,}bin $path /sbin )
