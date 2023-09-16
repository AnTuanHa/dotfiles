if status is-interactive
    # Disable help
    set -U fish_greeting
    # Show full current working directory path
    set -U fish_prompt_pwd_dir_length 0
    set -g fish_autosuggestion_enabled 0

    alias ls="eza"
    alias ll="eza --git --long --classify --group-directories-first --header --group"
    alias vim="nvim"

    export EDITOR="nvim"
    export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
    export FZF_DEFAULT_OPTS="--color 16"
    # Some programs such as neovim expect this env var to be set
    export XDG_CONFIG_HOME="$HOME/.config"

    bind --user \cx\ce edit_command_buffer

    eval $(dircolors -c ~/.dircolors)
    fish_config theme choose "Dracula Official"
end
