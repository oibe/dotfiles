# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bira"
#ZSH_THEME="robbyrussell"
ZSH_THEME="sporty_256"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Customize to your needs...

export INPUTRC="~/.inputrc"

export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS="gxGxBxDxcxEgEdxbxgxcxd"
export PATH="/usr/local/bin:$PATH"
#export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python2.7/site-packages/"
#export PYTHONPATH="$PYTHONPATH:/Users/Onwukike/Magnetic"
export PYTHONPATH="$PYTHONPATH:/Users/Onwukike/Magnetic/thidwick/"
#export PYTHONPATH="$PYTHONPATH:/Users/Onwukike/Magnetic/horton"
#export PYTHONPATH="$PYTHONPATH:/Users/Onwukike/Magnetic/qwobl/lib/python/"

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_SETUPTOOLS=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

alias pypath="env | grep PYTHONPATH"
alias recent="ls -lrt | tail"

# Helps to speed up auto completion for zsh
zstyle ":completion:*" accept-exact "*(N)"
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path !/.zsh/cache

source $ZSH/oh-my-zsh.sh

