function _uzle-get-word-under-cursor() {
	local WORD

	if (( $REGION_ACTIVE == 1 )); then
		local START=$MARK END=$CURSOR
		if [[ $START > $END ]]; then
			START=$CURSOR
			END=$MARK
		fi

		# get marked area from buffer and remove whitespace
		WORD=${BUFFER[$START+1,$END]%%[[:space:]]##}
		WORD=${WORD##[[:space:]]##}
	else
		local words lwords
		words=(${(z)BUFFER})
		lwords=(${(z)LBUFFER})
		WORD=${(Q)words[$#lwords]}
	fi

	if [[ -n $WORD ]]; then
		if zle; then
			zle -M $WORD
		else
			echo $WORD
		fi
	else
		return 1
	fi
}; zle -N get-word _uzle-get-word-under-cursor

function uzle-mkdir() {
	if (( $#BUFFER > 0 )); then
		local DIRPATH=$(_uzle-get-word-under-cursor)

		if [[ -d $DIRPATH ]]; then
			zle -M "error: directory '$DIRPATH' exists, doing nothing"
		else
			zle -M "$(command mkdir -vp $DIRPATH)"
		fi
	fi
}; zle -N mkdir uzle-mkdir

function uzle-chpwd() {
	if (( $#BUFFER > 0 )); then
		local DIRPATH=$(_uzle-get-word-under-cursor)

		if [[ -d $DIRPATH ]]; then
			cd $DIRPATH
			zle -M "cd: pwd is now '$DIRPATH'"
		else
			zle -M "error: '$DIRPATH' is not a directory"
		fi
	fi
}; zle -N chpwd uzle-chpwd
