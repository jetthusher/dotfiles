# CTRL+{Right,Left} for word-jump
bindkey -M viins -M visual -M vicmd	$'\E[1;5C'	forward-word	# CTRL+Left
bindkey -M viins -M visual -M vicmd	$'\E[1;5D'	backward-word	# CTRL+Right

# ALT+{Right,Left} for char-jump
bindkey -M viins -M visual -M vicmd	$'\E[1;3C'	forward-char	# ALT+Left
bindkey -M viins -M visual -M vicmd	$'\E[1;3D'	backward-char	# ALT+Right
