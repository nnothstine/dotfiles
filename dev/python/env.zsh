export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
path=( $PYENV_ROOT/bin $path )

__nan_has 'pyenv' && eval "$(pyenv init -)"
__nan_has 'pipenv' && eval "$(pipenv --completion)"