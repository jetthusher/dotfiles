if functions _zsh_autosuggest_accept > /dev/null; then
	# Disable history and enable completion suggestions
	ZSH_AUTOSUGGEST_STRATEGY=(completion)

	# Don't accept suggestions on <Right> or 'l', etc
	ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()

	# Use bold black (grey) in 8 colour terminals
	if [[ $TERM =~ 256color ]] || [[ $TERM =~ 16color ]] || [[ $TERM =~ xterm-kitty ]]; then
		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=08
	else
		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=black,bold
	fi

	bindkey -M viins -M vicmd '^ ' autosuggest-accept
fi
