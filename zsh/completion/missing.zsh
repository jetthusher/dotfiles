# Add bindings to missing programs

if functions compdef >/dev/null; then
	function () {
		local gnugen=(
			showkey
			setterm
			kdialog
		)

		local program
		for program in $gnugen; do
			compdef _gnu_generic $program
		done
	}
fi
