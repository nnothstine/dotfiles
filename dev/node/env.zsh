export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_CACHE_HOME/npm
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/node/repl_history
export NODENV_ROOT=$XDG_DATA_HOME/nodenv
path=( $NODENV_ROOT/shims $NODENV_ROOT/bin $path )

# Not working for some reason
# eval '$(nodenv init -)'
