# Enter `keyboard_transmit' mode. Needs for `$terminfo' key sequences to work
# properly. To disable, run `$terminfo[rmkx]'.
# (also can put `smkx' in `zle-line-init' and `rmkx' in `zle-line-finish'.
echo -n $terminfo[smkx]

# Add completions to `fpath'
fpath+=(/usr/local/share/zsh/completion)

# Load colours
autoload +X -U colours && colours && unfunction colours

# Load new and shiny completion system
autoload +X -U compinit && compinit

# Restore default state for keys, just in case
bindkey -d

# Remove emacs keymap
bindkey -D emacs

# Use vi keymap by default
bindkey -v
