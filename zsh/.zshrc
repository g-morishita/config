# Keep shell state under XDG-compatible directories where possible.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

[[ -d /opt/homebrew/bin ]] && path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
[[ -d /usr/local/bin ]] && path=(/usr/local/bin $path)
typeset -U path PATH

if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim
fi

# Durable, shared history across terminal sessions.
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
mkdir -p "${HISTFILE:h}"
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Friendly interactive behavior.
setopt AUTO_CD
setopt AUTO_PUSHD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt PUSHD_IGNORE_DUPS

# Native completion with a cached dump for faster startup.
autoload -Uz compinit
zcompdump="$XDG_CACHE_HOME/zsh/zcompdump"
mkdir -p "${zcompdump:h}"
compinit -d "$zcompdump"
unset zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/completion"

# Useful defaults with graceful fallbacks.
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias g='git'
alias gs='git status --short --branch'
alias gd='git diff'
alias gl='git log --graph --decorate --oneline --all'
alias v='nvim'

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --icons=auto'
  alias ll='eza --long --all --git --group-directories-first --icons=auto'
  alias tree='eza --tree --group-directories-first --icons=auto'
else
  alias ll='ls -lah'
fi

command -v bat >/dev/null 2>&1 && alias cat='bat --paging=never'

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --info=inline'
fi

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
