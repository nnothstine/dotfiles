source "$DOTFILES/shell/zsh/prompt.zsh"
source "$DOTFILES/shell/zsh/config.zsh"
source "$DOTFILES/shell/zsh/completion.zsh"
source "$DOTFILES/shell/zsh/keybindings.zsh"

autoload -Uz compinit && compinit -d $ZSH_CACHE/zcompdump
__nan_load_all aliases.zsh