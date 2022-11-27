# Allow to scroll backwards in lists
bindkey -M viins	$termkeys[back-tab]	reverse-menu-complete

# Let me out of `execute-named-command'
bindkey -M command			$termkeys[escape]	send-break

# Switch from `expand-or-complete' to `complete-word'
# It's required for proper work of `compsys'
bindkey -M viins	$termkeys[tab]		complete-word
