# =============================================================================
# 1. INSTANT PROMPT
# =============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# 2. OH-MY-ZSH & PLUGINS
# =============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_AUTO_TITLE="true"

plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# 3. CORE SETTINGS
# =============================================================================
# History
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Keybindings (Vim mode & History Search)
bindkey -v
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Window Title (Current Directory)
function set_win_title(){
  print -Pn "\e]0;%c\a"
}
precmd_functions+=(set_win_title)

# =============================================================================
# 4. TOOLS & ENV
# =============================================================================
# Zoxide
eval "$(zoxide init zsh)"

# NVM (Node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv (Python)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pipx
export PATH="$PATH:$HOME/.local/bin"

# Chruby (Ruby)
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# =============================================================================
# 5. ALIASES
# =============================================================================
alias ls="eza --icons=always"
alias cd="z"
alias woz="NVIM_APPNAME=nvim-kickstart nvim"
alias reload="source ~/.zshrc"

# =============================================================================
# 6. THEME & VISUALS (Bottom Load)
# =============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fix dark comment colors (typeset -A prevents "invalid subscript" error)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=cyan,bold'
