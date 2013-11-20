# ------------------
# .zshrc Config File
# ------------------

# Ruby
export PATH=$PATH:~/.gem/ruby/2.0.0/bin

# BSPWM
export PATH=$PATH:/home/an/.config/scripts
export PANEL_FIFO="/tmp/panel-fifo"
export XDG_CONFIG_HOME="/home/an/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"

# Colourize ls' output
alias ls="ls --color"

# Colourize grep's output
alias grep="grep --color"

# Use only one instance of gvim
alias gvimrs="gvim --remote-silent"

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'       # end mode
export LESS_TERMCAP_se=$'\E[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\E[1;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'       # end underline
export LESS_TERMCAP_us=$'\E[1;32m'    # begin underline

# Less source-highlighting
export PAGER="less"
export LESS="-R"
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
alias less="less -x4RFsX"

# Editor
export EDITOR="/usr/bin/vim"

# History Settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Extended Globbing
setopt extendedglob

# Allows you to press things such as CTRL-A, just like in bash
bindkey -e

# CTRL-W Bash-esque Word Delimiters
autoload -U select-word-style && select-word-style bash

# Command Completion
autoload -Uz compinit && compinit

# Allows usage of colour in prompts
autoload -Uz colors && colors

# Version Control System
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr "%{$fg_bold[magenta]%}*"
zstyle ':vcs_info:*' unstagedstr "%{$fg_bold[cyan]%}?"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil mtn p4 svk tla hg svn
zstyle ':vcs_info:*' enable git

precmd () {
    # Show branch name and show whether there's things staged or unstaged
    zstyle ':vcs_info:*' formats '%b%c%u'

    vcs_info
}

# Prompt Substitution (required for vcs_info)
setopt prompt_subst

# Prompt
PROMPT=""
PROMPT+="%{$fg[red]%}%n"                     # Username
PROMPT+="%{$reset_color%}@"                  # @
PROMPT+="%{$fg[blue]%}%m"                    # Hostname
PROMPT+="%{$reset_color%} in"                # In
PROMPT+="%{$fg[green]%} [%~]"                # Working Directory
PROMPT+='%{$fg[yellow]%} ${vcs_info_msg_0_}' # Version Control System
PROMPT+="
"                                            # New Line
PROMPT+="%{$reset_color%}$ "                 # $
