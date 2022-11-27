function zle-line-init zle-keymap-select() {
	case $KEYMAP in
		visual|vicmd|viopp) echo -ne $termcursors[block];;
		main|viins) echo -ne $termcursors[i-beam];;
	esac
}

zle -N zle-line-init
zle -N zle-keymap-select
