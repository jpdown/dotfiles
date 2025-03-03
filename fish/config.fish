if status is-interactive
    # Commands to run in interactive sessions can go here

    function cdg
        set repo (eza -D ~/git | fzf --ansi)
        if test -n "$repo"
            cd ~/git/$repo
        end
    end

end

# Created by `pipx` on 2025-03-03 21:21:06
set PATH $PATH /home/jaden/.local/bin
