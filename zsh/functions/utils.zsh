# List key=value of associative array
function lsassoc() {
	if (( $ARGC != 1 )); then
		echo "Usage: $0 <varname>" >&2
		return 1
	fi

	{
		local k v
		for k in ${(Pk)1}; do
			v=`eval echo -n '$'$1'['$k']'`
			echo "[$k]=$v"
		done
	} | sort
}

# List array values line-by-line
function lsarr() {
	if (( $ARGC != 1 )); then
		echo "Usage: $0 <varname>" >&2
		return 1
	fi

	local item
	for item in ${(P)1}; do
		echo $item
	done
}; compdef _arrays lsarr

# List colours and test different variants
function lscolour() {
	function __usage() {
		cat << EOF
Usage: lscolour [options] <colours and styles>

List and test colour pallete.

Options:
  -t, --text <text>	- Use specified text instead of predefined one
  -h, --help		- Show available commands and options
EOF

		unfunction $0
	}

	local err=false text help
	zparseopts -M -D -E -F -K \
		t:=text -text=text \
		h=help -help=help \
		|| err=true

	if $err; then
		__usage >&2
		return 1
	fi

	if [[ -n $help ]]; then
		__usage
		return 0
	fi

	if (( $#text == 2 )); then
		text=$text[2]
	fi

	unfunction __usage

	local string=${text:-'ABCDE; fghijklmnopqrstuvwxyz1234567890: --> -> ==> !@#$%^&*(){}[]'}
	local reset=$colours[reset]

	local got_fg=false
	local got_bg=false
	local got_style=false

	if (( $ARGC > 0 )); then
		local style applied_styles
		for style in $@; do
			applied_styles+=$colours[$style]
			if grep -- $style <<< $styles > /dev/null; then
				got_style=true
			elif grep -- $style <<< $fgs > /dev/null; then
				got_fg=true
			elif grep -- $style <<< $bgs > /dev/null; then
				got_bg=true
			else
				echo "error: did not recognize '$style' as style, foreground, or background" >&2
				return 1
			fi
		done
	fi


	# Entering a subshell to negate array overwrite
	(
		local i
		# Unset default bg and fg
		i=$fgs[(i)default]
		fgs[($i + 1)]=()
		fgs[$i]=()

		i=$bgs[(i)bg-default]
		bgs[($i + 1)]=()
		bgs[$i]=()

		if $got_style; then
			# Unset applied styles
			local name_to_remove
			for name_to_remove in $@; do
				i=$styles[(i)$name_to_remove]
				styles[($i + 1)]=()
				styles[$i]=()
			done
		fi
		
		local printbuffer

		# No need to unfunction, we're in subshell
		function badd() printbuffer+=$@'\n'
		function bapp() printbuffer=$@'\n'$printbuffer

		local name code
		if ! $got_fg; then
			badd $colours[bold]Foregrounds:$reset
			for name code in $fgs; do
				badd $name: $applied_styles$code$string$reset
			done
			badd
		fi
			
		if ! $got_bg; then
			badd $colours[bold]Backgrounds:$reset
			for name code in $bgs; do
				badd $name: $applied_styles$code$string$reset
			done
			badd
		fi

		if (( $#styles > 0 )); then
			badd $colours[bold]Styles:$reset
			for name code in $styles; do
				badd $name: $applied_styles$code$string$reset
			done
			badd
		fi

		printbuffer=$(echo -en $printbuffer | column -t -L)

		if $got_fg || $got_bg || $got_style; then
			bapp
			bapp $applied_styles$string$reset
		fi

		if (( $(wc -l <<< $printbuffer) < $LINES )); then
			echo $printbuffer
		else
			echo $printbuffer | less -r
		fi
	)
}
