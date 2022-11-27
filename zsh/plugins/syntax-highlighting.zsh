ZSH_HIGHLIGHT_MAXLENGTH=256
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor line pattern regexp)
ZSH_HIGHLIGHT_STYLES+=(
	dollar-double-quoted-argument	fg=blue,bold
	back-dollar-quoted-argument	fg=blue,bold
	alias				fg=magenta,bold
	suffix-alias			fg=magenta,bold
	global-alias			fg=magenta,bold
	commandseparator		fg=08
	named-fd			fg=cyan,bold
	numeric-fd			fg=cyan,bold
	function			fg=default,bold
	arg0				fg=green,bold
	unknown-token			none
	builtin				fg=yellow,bold
	redirection			fg=yellow,bold
	reserved-word			fg=yellow,bold
	precommand			fg=yellow,bold
	double-hyphen-option		fg=cyan
	single-hyphen-option		fg=cyan
	path				none
	path-directory			fg=blue,bold
	path-file			underline
	path-link			fg=cyan,bold
	path-named-pipe			fg=yellow
	path-special-file		fg=yellow,bold
	path-sticky-bit			fg=green,standout
	path-socket			fg=magenta,bold
	cursor				fg=default,bg=default
)

# Rewrite of the highlight function to highlight dirs separately
function _zsh_highlight_main_highlighter_check_path() {
	if [[ -e $1 ]]; then
		REPLY=path

		if [[ -d $1 ]]; then REPLY=path-directory; fi
		if [[ -p $1 ]]; then REPLY=path-named-pipe; fi
		if [[ -L $1 ]]; then REPLY=path-link; fi
		if [[ -b $1 ]] || [[ -c $1 ]]; then REPLY=path-special-file; fi
		if [[ -k $1 ]]; then REPLY=path-sticky-bit; fi
		if [[ -f $1 ]]; then REPLY=path-file; fi
		if [[ -S $1 ]]; then REPLY=path-socket; fi

		return 0
	fi
	return 1
}
