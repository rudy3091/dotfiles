#!/bin/sh

check_installed () {
	local file=${1}
	if [ -z $(which file) ]; then
		echo "${file} is not installed"
	else
		echo "${file} is installed on $(which ${file})"
	fi
}

result_rows () {
	local bookmark=${1}
	echo $(cat ~/bookmarks | grep ${1} | wc -l)
}

search_bookmarked () {
	echo $(cat ~/bookmarks | grep ${1})
}

if [ -z ${1} ]; then
	echo "Usage: goto [TARGET]..."
	return
fi

if [ -z $(find ~/bookmarks) ]; then
	echo "\x1B[31mcreated bookmarks on home directory (~/bookmarks)\x1B[0m"
	touch ~/bookmarks
fi

matches=$(result_rows ${1})

if [ ${matches} -ge 1 ]; then
	if [ ${matches} -eq 1 ]; then
		loc=$(cat ~/bookmarks | grep ${1})

		echo " 🚀 going to $loc"
		cd $loc

	else 
		echo "multiple results: "

		idx=0
		for item in $(search_bookmarked ${1});
		do
			idx=$((idx+1))
			echo "\x1B[31m[$idx]\x1B[0m: $item"
		done
		echo -n " \x1B[31m>\x1B[0m "

		read target

		if [ -n $target ] && [ $target -eq $target ] 2>/dev/null; then
			if [ $target -gt $idx ]; then
				echo "invalid number"
			else
				loc=$(cat ~/bookmarks | grep -m$target ${1} | tail -n1)
				echo " 🚀 going to $loc"
				cd $loc
			fi
			
		else
			echo "invalid target"
		fi
		
	fi

elif [ ${matches} -eq 0 ]; then
	echo "${1} is not bookmarked"

fi
