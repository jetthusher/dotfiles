# Nav cluster functionality
bindkey -M viins 			$termkeys[delete]	delete-char
bindkey -M viins -M visual -M vicmd	$termkeys[home]		beginning-of-line
bindkey -M viins -M visual -M vicmd	$termkeys[end]		end-of-line
bindkey -M viins -M visual -M vicmd	$termkeys[page-up]	up-history
bindkey -M viins -M visual -M vicmd	$termkeys[page-down]	down-history
