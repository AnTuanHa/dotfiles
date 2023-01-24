# ------------------
# .zshrc Config File
# ------------------

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(dircolors -b ~/.dircolors)

# Colourize ls' output
alias ls="ls -Fh --color=auto"
alias ll="ls -Fhl --color=auto"

# Colourize grep's output
alias grep="grep --color"

# Use only one instance of gvim
alias gvimrs="gvim --remote-silent"

alias vim="nvim"

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
export LESS="-Ri"
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
alias less="less -x4RFsX"

# Editor
export EDITOR="/usr/bin/vim"

# History Settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

set PROMPT_SUBST

unsetopt MENU_COMPLETE
setopt AUTO_MENU

# Extended Globbing
setopt extendedglob

# CTRL-W Bash-esque Word Delimiters
autoload -U select-word-style && select-word-style bash

# Command Completion
autoload -Uz compinit && compinit
zmodload -i zsh/complist

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

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Autocompletion with arrow-keys
zstyle ':completion:*' menu select

# Better history searching with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '

# Prompt Substitution (required for vcs_info)
setopt prompt_subst

# Prompt
PROMPT=""
PROMPT+="%{$fg[green]%}%n"                   # Username
PROMPT+="%{$reset_color%}@"                  # @
PROMPT+="%{$fg[blue]%}%m"                    # Hostname
PROMPT+="%{$reset_color%} in"                # In
PROMPT+="%{$fg[red]%} [%~]"                  # Working Directory
PROMPT+='%{$fg[yellow]%} ${vcs_info_msg_0_}' # Version Control System
PROMPT+="
"                                            # New Line
PROMPT+="%{$reset_color%}> "                 # $

# Emacs mode
bindkey -e

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# No delay going from insert mode to normal mode
export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
