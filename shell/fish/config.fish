
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_BIN_HOME "$HOME/.local/bin"

set -x DOTFILES "$HOME/.dotfiles"
set -x DOTFILES_DATA "$XDG_DATA_HOME/dotfiles"
set -x DOTFILES_ASSETS "$DOTFILES/assets"

for dir in $XDG_CACHE_HOME $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_BIN_HOME $DOTFILES_DATA
    if not test -d "$dir"
        mkdir -p "$dir"
    end
end

set -x FDOTDIR "$DOTFILES/shell/fish"

# Hush now, quiet now
set fish_greeting

# Set vi mode
fish_vi_key_bindings

source "$FDOTDIR/aliases.fish"