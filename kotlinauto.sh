files="$@"

if [ ${#files} -eq 0 ]; then
	kotlin -classpath main.jar MainKt

else
	parse () {
		echo "${files}" | cut -c4-${#files}
	}
	cmd=$(parse)

	while getopts ":b:" opt
	do
		case $opt in
			b)
				kotlinc -d main.jar $cmd
				;;
		esac
	done

	kotlin -classpath main.jar MainKt

fi

