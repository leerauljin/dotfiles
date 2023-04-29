# If you come from bash you might have to change your $PATH.
#
# export TERM="xterm-256color"
# [[ -n $TMUX ]] && export TERM="screen-256color" export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/Applications/Stata/StataMP.app/Contents/MacOS:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH
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
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zthxxx/zsh-history-enquirer
antigen bundle jeffreytse/zsh-vi-mode

# Syntax highlighting bundle.


# Tell Antigen that you're done.
antigen apply


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

# source $ZSH/oh-my-zsh.sh

# User configuration

# fpath+=/Users/seonjinlee/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

alias python=python3
alias pip=pip3
alias vim=nvim
alias v=nvim
alias ls="exa -l --group-directories-first"
alias tm=tmux
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias f="fd --type f --hidden --exclude .git --exclude .DS_Store | fzf-tmux -p --reverse | xargs nvim"
alias lg=lazygit
alias dd="docker compose down"
alias du="docker compose up -d"
alias dl="docker container ls"
alias dnl="docker network ls"

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

# Following line was automatically added by arttime installer
export PATH=/Users/seonjinlee/.local/bin:$PATH
