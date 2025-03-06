function cdg
    set repo (eza -D ~/git | fzf --ansi)
    if test -n "$repo"
        cd ~/git/$repo
    end
end

