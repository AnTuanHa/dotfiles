function nvim-session
    set socket_dir /tmp/nvim-sessions
    set switch_flag /tmp/nvim-switch-flag
    mkdir -p $socket_dir

    while true
        rm -f $switch_flag

        set sessions (command ls $socket_dir 2>/dev/null | while read f
            test -S "$socket_dir/$f" && echo $f
        end)
        set choices $sessions "+ New session"
        set choice (printf "%s\n" $choices | fzf --prompt="nvim> ")

        test -z "$choice"; and return

        if test "$choice" = "+ New session"
            read -P "Session name: " name
            test -z "$name"; and return

            set socket "$socket_dir/$name"
            if test -S $socket
                echo "Session already exists: $name"
                continue
            end

            nvim --listen $socket
        else
            set socket "$socket_dir/$choice"

            if not test -S $socket
                echo "Stale socket, removing $choice"
                rm -f $socket
                continue
            end

            nvim --server $socket --remote-ui
        end

        # After nvim exits/detaches, loop back to picker if flag exists
        test -f $switch_flag || break
    end
end
