# Keys, listed with `terminfo', require `keyboard_transmit' mode to be enabled
# to function properly. This is done in `init.zsh' with `$terminfo[smkx]'.
typeset -UA termkeys=(
	backspace	$terminfo[kbs]
	enter		$'\r'
	escape		$'\e'
	tab		$'\t'
	back-tab	$terminfo[kcbt]

	home		$terminfo[khome]
	end		$terminfo[kend]
	insert		$terminfo[kich1]
	delete		$terminfo[kdch1]
	page-up		$terminfo[kpp]
	page-down	$terminfo[knp]

	arrow-up	$terminfo[kcuu1]
	arrow-down	$terminfo[kcud1]
	arrow-left	$terminfo[kcub1]
	arrow-right	$terminfo[kcuf1]
)

# `$terminfo' duplicates are for work in TTY
typeset -UA termcursors=(
	invisible	$terminfo[civis]
	i-beam		'\x1b[\x36 q'$terminfo[cnorm]
	block		'\x1b[\x32 q'$terminfo[cvvis]
)
