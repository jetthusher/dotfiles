# Enable colours for completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Add a message on what is being completed
zstyle ':completion:*:descriptions' format 'completing %B%F{red}%d%b%F{default}'

# Complete manual by their section
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

# Activate menu
zstyle ':completion:*:history-words' menu yes

# ignore duplicate entries
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# separate matches into groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''


zstyle ':completion:*' menu select=5
