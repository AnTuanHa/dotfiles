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

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '

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
PROMPT+="%{$reset_color%}> "                 # $

# Vi mode, use bindkey -e for emacs mode
bindkey -v

bindkey -a u undo
bindkey -a '^R' redo

# Allows you to use backspace in insert mode
bindkey '^?' backward-delete-char

# Same as above, but with CTRL H
bindkey "^H" backward-delete-char

# CTRL W to delete word
bindkey "^W" backward-kill-word 

# CTRL U to delete line
bindkey "^U" backward-kill-line

# Bring back Emacs keybindings in insert mode
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line

# Set / and ? to be more like vim, where / is searching forward and ? is
# searching backwards
bindkey -M vicmd '/' vi-history-search-forward
bindkey -M vicmd '?' vi-history-search-backward

# No delay going from insert mode to normal mode
export KEYTIMEOUT=1

# Vim mode indicatiors
vim_ins_mode="-- INSERT --"
vim_cmd_mode="-- NORMAL --"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

RPROMPT='${vim_mode}'
RPROMPT2='${vim_mode}'
