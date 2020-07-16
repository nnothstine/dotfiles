export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYTHONHISTORY="$XDG_CACHE_HOME/pythonhistory"
path=( $PYENV_ROOT/shims $path )

#__nan_has 'pyenv' && eval "$(pyenv init -)"
#__nan_has 'pipenv' && eval "$(pipenv --completion)"
