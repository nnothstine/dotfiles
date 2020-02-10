__load_repo zdharma/zinit $ZINITDIR zinit.zsh

if __nan_has zinit; then
    source "$DOTFILES/shell/zsh/zinit.zsh"
else
    echo "Failed to load zinit. Check your settings."
fi

# ============================================================================
# Modules
# ============================================================================

# http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html
# Completion listing extensions
zmodload zsh/complist

# ============================================================================
# Load order
# ============================================================================

source "$DOTFILES/shell/zsh/prompt.zsh"
source "$DOTFILES/shell/zsh/config.zsh"
source "$DOTFILES/shell/zsh/keybindings.zsh"
source "$DOTFILES/shell/zsh/completion.zsh"

autoload -Uz compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Requires EXTENDED_GLOB=true; run compinit once every 24 hours, not on demand
if [[ -n "$ZSH_CACHE/zcompdump"(#qN.mh+24) ]]; then
    compinit -i -d $ZSH_CACHE/zcompdump
else
    compinit -C -d $ZSH_CACHE/zcompdump
fi

__nan_load_all aliases.zsh