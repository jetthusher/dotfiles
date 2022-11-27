# Bindkey support for multiple keymaps
function bindkey() {
	typeset -Ua keymaps
	zparseopts -M -D -E -K -a keymaps M+: 2>/dev/null

	# Remove first '-M' from array to leave only keymaps (-U flag makes
	# sure there is only one '-M' in the array)
	keymaps[1]=()
	
	if (( $#keymaps > 0 )); then
		local keymap
		for keymap in $keymaps; do
			builtin bindkey -M $keymap $@
		done
	else
		builtin bindkey $@
	fi
}

# `zle -C` support for optional function name
function zle() {
	typeset -a completion
	zparseopts -M -D -E -K -a completion C 2>/dev/null

	if (( $#completion > 0 )); then
		local widget=$1
		local builtin=$2
		local function=${3:-$widget}
		builtin zle -C $widget $builtin $function
	else
		builtin zle $@
	fi
}
