# Completition

## If a completion is performed with the cursor within a word,
## and a full completion is inserted, the cursor is moved
## to the end of the word
setopt ALWAYS_TO_END

## Prevents aliases on the command line from being internally substituted
## before completion is attempted
setopt COMPLETE_ALIASES

## If unset, the cursor is set to the end of the word if completion is started.
## Otherwise it stays there and completion is done from both ends
setopt COMPLETE_IN_WORD

## Try to make the completion list smaller by printing
## the matches in columns with different widths
setopt LIST_PACKED
