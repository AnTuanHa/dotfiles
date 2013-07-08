# ------------------
# .zshrc Config File
# ------------------

# Colourize ls' output
alias ls="ls --color"

# Shell commands saved to ~/.histfile
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Extended Globbing
setopt extendedglob

# Allows you to press things such as CTRL-A, just like in bash
bindkey -e

# Command Completion
autoload -Uz compinit && compinit

# Allows usage of color in prompts
autoload -Uz colors && colors

# Version Control System
autoload -Uz vcs_info

precmd () {
    # Show branch name only
    zstyle ':vcs_info:*' formats '[%b]'

    vcs_info
}

zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil mtn p4 svk tla hg svn
zstyle ':vcs_info:*' enable git
setopt prompt_subst

# Prompt
PROMPT=""
PROMPT+="%{$fg[red]%}%n" # Username
PROMPT+="%{$reset_color%}@" # @
PROMPT+="%{$fg[blue]%}%m" # Hostname
PROMPT+="%{$reset_color%} in" # In
PROMPT+="%{$fg[green]%} [%~]" # Working Directory
PROMPT+='%{$fg[yellow]%} ${vcs_info_msg_0_}' # Version Control System
PROMPT+="
" # New Line
PROMPT+="%{$reset_color%}$ " # $

# RPROMPT
RPROMPT="%*" # HH:MM:SS
