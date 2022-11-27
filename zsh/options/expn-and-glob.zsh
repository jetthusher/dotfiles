# Expansion and Globbing

# The pattern `**/*' can be abbreviated to `**' and the pattern `***/*' can be
# abbreviated to ***
setopt GLOB_STAR_SHORT

# All unquoted arguments of the form `anything=expression' # appearing after
# the command name have filename expansion
setopt MAGIC_EQUAL_SUBST

# Append a trailing `/' to all directory names resulting # from filename
# generation
setopt MARK_DIRS

# Array expansions of the form `foo${xx}bar', # where the parameter xx is set
# to (a b c), # are substituted with `fooabar foobbar foocbar' # instead of the
# default  `fooa b cbar'
setopt RC_EXPAND_PARAM

# Print  a  warning  message when a global parameter is created in a function
# by an assignment or in math context
setopt WARN_CREATE_GLOBAL
