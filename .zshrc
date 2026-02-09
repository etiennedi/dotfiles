# --- Completion system (must init before plugins that use compdef) ---
autoload -Uz compinit && compinit

# --- OMZ compatibility (cache dir used by docker plugin et al.) ---
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
[[ -d "$ZSH_CACHE_DIR/completions" ]] || mkdir -p "$ZSH_CACHE_DIR/completions"

# --- Plugin Manager (Antidote) ---
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# --- NVM (must be before antidote loads zsh-nvm) ---
export NVM_LAZY_LOAD=true

# --- Prompt ---
eval "$(starship init zsh)"

# --- Modern tools ---
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
source <(fzf --zsh)

# --- Environment ---
export LANG=en_US.UTF-8
DISABLE_AUTO_TITLE="true"

# --- Aliases ---

# Weaviate
alias dcd='docker-compose -f docker-compose-dev.yml'

# GCloud
alias g='gcloud'
alias gconfl='gcloud config configurations list'
alias gconfa='gcloud config configurations activate'
alias gclusl='gcloud container clusters list'
alias gclusgc='gcloud container clusters get-credentials'

# Docker
alias drm='docker rm -f $(docker ps -q)'

# Tmux
alias trs='tmux resize-pane -y 13'
alias trm='tmux resize-pane -y 26'

# Modern CLI replacements
alias ls='eza'
alias ll='eza -l --git'
alias la='eza -la --git'
alias tree='eza --tree'
alias cat='bat --plain'

# --- Tool integrations ---

# Google Cloud SDK
if [ -f "$HOME/code/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/code/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/code/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/code/google-cloud-sdk/completion.zsh.inc"
fi

# --- Interactive functions ---
function ai() {
  echo "${@}" | claude -p \
    --append-system-prompt "You are a terminal/bash expert. The user will invoke you when they are not sure about a command. Respond with only a single command that accomplishes the user's goal. Do not include any explanations or additional text. Do not use Markdown formatting, your response will be printed directly in the user's terminal, this also means no backticks around a code block. If the request is impossible to fulfill then respond with Error: followed by an explanation why." \
    --allowedTools "Read,Grep,WebSearch"
}

# --- Private ---
source ~/.secrets

# --- PATH (additions beyond .zprofile) ---
export PATH="$HOME/.local/bin:$PATH"
