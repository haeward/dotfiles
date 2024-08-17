### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# zsh plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
### End of Zinit's installer chunk


# Load completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
rm -f ~/.zcompdump; compinit

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab init and styling
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza --icons -1 --color=always $realpath'


# History
HISTSIZE=5000
HISTFILESIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory              # Append history instead of overwriting
setopt inc_append_history         # Save each command to history immediately
setopt hist_ignore_space          # Ignore commands starting with a space
setopt hist_ignore_all_dups       # Ignore all duplicate commands
setopt hist_save_no_dups          # Skip duplicates when saving history
setopt hist_ignore_dups           # Ignore adjacent duplicate commands
setopt hist_find_no_dups          # Ignore duplicates in history search
setopt sharehistory               # Share history across all sessions
setopt extended_history           # Save timestamps with history

# Set timestamp format for history
export HIST_STAMPS="yyyy-mm-dd HH:MM:ss"

# Ignore specific commands in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Auto-save history after each command
export HIST_SAVE_BY_LINES=1

# Enhance history search
bindkey "^R" history-incremental-pattern-search-backward
zstyle ':completion:*:history-words' sort no


# Aliases
alias cls="clear"
alias ls="eza"
alias ll="eza --time-style=default --icons --git -l"
alias la="eza --time-style=long-iso --icons --group --git --binary -la"
alias tree="eza --tree --icons"
alias hist="history 1"
alias cat="bat"
alias vi="nvim"
alias vim="nvim"
alias upgrade="brew update && brew upgrade && brew cu --all --yes --cleanup && mas upgrade && brew cleanup"
alias lzd="lazydocker"
alias lzg="lazygit"
alias pf='fzf --preview='\''bat --color=always --style=header,grid --line-range :500 {}'\''  --bind shift-up:preview-page-up,shift-down:preview-page-down'


# Color Scheme
export BLACK=0xff181819
export WHITE=0xffe2e2e3
export RED=0xfffc5d7c
export GREEN=0xff9ed072
export BLUE=0xff76cce0
export YELLOW=0xffe7c664
export ORANGE=0xfff39660
export MAGENTA=0xffb39df3
export GREY=0xff7f8490
export TRANSPARENT=0x00000000
export BG0=0xff2c2e34
export BG1=0xff363944
export BG2=0xff414550


# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# brew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# bat theme
export BAT_THEME="Monokai Extended Origin"

# fzf
# source <(fzf --zsh)
eval "$(fzf --zsh)"

# GPG
export GPG_TTY=$(tty)

# rust
. "$HOME/.cargo/env"

# zoxide
eval "$(zoxide init zsh)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# fnm
eval "$(fnm env --use-on-cd)"
