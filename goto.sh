#!/bin/sh

check_installed () {
	local file=${1}
	if [ -z $(which file) ]; then
		echo "${file} is not installed"
	else
		echo "${file} is installed on $(which ${file})"
	fi
}

check_bookmarked () {
	local bookmark=${1}
	echo $(cat ~/bookmarks | grep ${1} | wc -l)
}

matches=$(check_bookmarked ${1})

if [ ${matches} -ge 1 ]; then
	if [ ${matches} -eq 1 ]; then
		loc=$(cat ~/bookmarks | grep ${1})

		echo "changing to ${loc}"
		cd $loc

	else 
		echo "multiple results: "

		idx=1
		arr=("array")
		for item in $(search_bookmarked ${1});
		do
			echo "\x1B[31m[$idx]\x1B[0m: $item"
			idx=$((idx+1))
			arr+=($item)
		done
		echo -n "\x1B[31m>\x1B[0m "

		read target

		loc=$(cat ~/bookmarks | grep -m$target ${1} | tail -n1)
		echo " 🚀 going to $loc"
		cd $loc
		
	fi

elif [ ${matches} -eq 0 ]; then
	echo "${1} is not bookmarked"

fi
