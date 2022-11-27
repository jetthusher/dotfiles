function uzle-tmux-chpane-{R,L,D,U,l}() {
	local key=$WIDGET[-1]
	if [[ -n $TMUX ]] tmux select-pane -$key
}

zle -N tmux-chpane-R uzle-tmux-chpane-R
zle -N tmux-chpane-L uzle-tmux-chpane-L
zle -N tmux-chpane-D uzle-tmux-chpane-D
zle -N tmux-chpane-U uzle-tmux-chpane-U
zle -N tmux-chpane-l uzle-tmux-chpane-l
