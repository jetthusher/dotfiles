# Create a directory and 'cd' into it
function mkcd() {
	if (( $ARGC != 1  )); then
		echo "Usage: $0 <path>"
	fi

	mkdir -p ${1:-~}
	cd ${1:-~}
}; compdef _directories mkcd

# 'ls -l', but without 'total *' part
function ll() {
	ls -lh --color=always --hyperlink=always $@ | tail -n +2
}; compdef ll=ls

# Responsively list files
function list() {
	# The idea here is to count files as lines, since `ll' will print them
	# line-by-line anyway.
	
	# Need to force `ls' to print in column mode and tell how many columns
	# there are.
	# Also specifying `--quoting-style=escape' to remove '\ ' sequences.
	# This is needed for proper file counting with `wc -w'.
	local ls_output=$(
		COLUMNS=$COLUMNS ls -C --quoting-style=escape $@ \
			| sed 's:\\ ::g'
	)
	
	if [[ -z $ls_output ]] return

	local fcount=$(echo $ls_output | wc -w)
	local lcount=$(echo $ls_output | wc -l)

	# Don't forget about prompt!
	local prompt_lcount=$(echo $PROMPT | wc -l)
	local available_lines=$(( $LINES-$prompt_lcount ))

	if (( $fcount <= $available_lines )); then
		ll $@
	elif (( $lcount <= $available_lines )); then
		ls $@
	else
		echo "$fcount files"
	fi
}; compdef _nothing list

# Edit/View file contents with a chosen editor
function edit() {
	$EDITOR $editor_edit_options $@
}

function view() {
	$EDITOR $editor_view_options $@
}
