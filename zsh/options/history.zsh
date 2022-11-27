# History

## Locking is done by means of the system's fcntl call
setopt HIST_FCNTL_LOCK

## Do not enter command lines into the history list
## if they are duplicates of the previous event
setopt HIST_IGNORE_DUPS

## Words read in from a history file are divided up in
## a similar fashion to normal shell command line handling
setopt HIST_LEX_WORDS

## New history lines are added to the $HISTFILE incrementally
setopt INC_APPEND_HISTORY

## Perform history expansion and reload the line into the editing buffer
setopt HIST_VERIFY
