# these rm commands will fail if they are folders and not symlinks

rm ~/.config/nvim
ln -s "$(pwd)/nvim/" ~/.config/nvim
rm ~/.config/ghostty
ln -s "$(pwd)/ghostty/" ~/.config/ghostty
rm ~/.config/fish
ln -s "$(pwd)/fish/" ~/.config/fish
