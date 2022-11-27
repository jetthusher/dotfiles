# Hook functions, see zshmisc(1) ##Hook Functions

function preexec-set-block-cursor() {
	local program
	for program in $block_cursor_programs; do
		if grep -Eq "(^|\| )$program" <<< $3; then
			echo -n $termcursors[block]
		fi
	done
}

# Nav cluster behaves weird after launching `nvim', this solves the problem
function terminfo-fix () echo -n $terminfo[smkx]

chpwd_functions+=(list)
preexec_functions+=(preexec-set-block-cursor) 
precmd_functions+=(vcs_info terminfo-fix)
