# Make `less' *more* colourful
# See less(1) #OPTIONS for details
export LESS='-R --use-color -Dd+y$Du+y$DPkY$DEwr$DSWM'

# Set LS_COLORS variable
eval `dircolors`

# Switch term from `linux` to `linux-16color` for better colour support
if [[ $TERM == linux ]]; then
	TERM=linux-16color
fi
