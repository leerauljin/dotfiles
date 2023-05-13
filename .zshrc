# If you come from bash you might have to change your $PATH.
#
# export TERM="xterm-256color"
# [[ -n $TMUX ]] && export TERM="screen-256color" export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/Applications/Stata/StataMP.app/Contents/MacOS:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR=$(which nvim)
export PATH=$HOME/go/bin:$PATH

if [[ $(uname -m) == 'arm64' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
  export ARCHFLAGS="-arch arm64"
fi

source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode

# Tell Antigen that you're done.
antigen apply


ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
plugins=()

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias a=z
alias python=python3
alias pip=pip3
alias e=nvim
alias l="exa -l --group-directories-first"
alias tm=tmux
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias lg=lazygit
alias dd="docker compose down"
alias du="docker compose up -d"
alias dl="docker container ls"
alias dnl="docker network ls"
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export HOMEBREW_NO_AUTO_UPDATE=true
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

export FZF_DEFAULT_OPTS='
  --color fg:#5d6466,bg:#1e2527
  --color bg+:#ef7d7d,fg+:#2c2f30
  --color hl:#dadada,hl+:#26292a,gutter:#1e2527
  --color pointer:#373d49,info:#606672
  --border
  --color border:#1e2527
  --height 13'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
