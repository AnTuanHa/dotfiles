if status is-interactive
    # Disable help
    set -U fish_greeting
    # Show full current working directory path
    set -U fish_prompt_pwd_dir_length 0
    set -g fish_autosuggestion_enabled 0

    alias ls="eza"
    alias ll="eza --git --long --classify --group-directories-first --header --group"
    alias vim="nvim"

    export SHELL="fish"
    export EDITOR="nvim"
    # Some programs such as neovim expect this env var to be set
    export XDG_CONFIG_HOME="$HOME/.config"

    export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
    export MANPAGER='nvim +Man!'

    export GPG_TTY=$(tty)

    bind --erase --preset ctrl-e
    bind --user \cx\ce edit_command_buffer

    fish_config theme choose "Dracula Official"

    fzf --fish | source
end
