# Make `WORDCHARS' more like ViM's `iskeyword'
WORDCHARS=@_

# The maximum size of the directory stack
DIRSTACKSIZE=8

# The file to save the history in
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# The maximum number of history events to save in the history file
SAVEHIST=10000

# The maximum number of events stored in the internal history list
HISTSIZE=5000

# Watch for all login events
watch=(all)

# Format of login event report
WATCHFMT='%B%n%b has %B%a%b %B%l%b at %T on %D'

# Reduce key timeout for faster ESC recognition
KEYTIMEOUT=10
