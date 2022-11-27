function () {
	local k
	# Unset all user named directories for regular users
	if [[ $UID != 0 ]]; then
		for k in ${(k)userdirs}; do
			unhash -d $k
		done
	# Unest all usersdirs that point to `/'
	else
		for k in ${(k)userdirs}; do
			if [[ $userdirs[$k] == / ]]; then
				unhash -d $k
			fi
		done
	fi
}
