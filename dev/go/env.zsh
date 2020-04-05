export GOPATH="${HOME}/.local/go"
export GOENV_ROOT=$XDG_CONFIG_HOME/goenv
path=($GOENV_ROOT/bin $path)
eval "$(goenv init -)"
