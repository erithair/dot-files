# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="smt" # includes time since last git commit

source ~/.zsh_alias

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# load up Z
. ~/.oh-my-zsh/custom/plugins/z/z.sh

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Android SDK
export PATH=$PATH:$HOME/local/android-sdk-macosx/tools/:$HOME/local/android-sdk-macosx/platform-tools/

export EDITOR=/usr/bin/vim

# MySQL
export PATH=$PATH:/usr/local/mysql/bin

DISABLE_AUTO_TITLE=true
unsetopt correct_all

# Add current path
export PATH=$PATH:.

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# git flow completion
source ~/dot-files/git-flow-completion.zsh

# press C-X C-E to edit command line with $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line


# Functions
current_hotfix_branch ()
{
  local hotfix_prefix=$(git config --get gitflow.prefix.hotfix)
  local hotfix_branches=$(echo "$(git branch --no-color | sed 's/^[* ] //')" | grep "^$hotfix_prefix")
  local first_branch=$(echo ${hotfix_branches} | head -n1)
  first_branch=${first_branch#$hotfix_prefix}
  echo "$first_branch"
}
