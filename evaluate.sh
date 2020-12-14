#!/bin/bash
##Write a shell script that meets the following requirements:
##•	It should evaluate the first argument provided.
##•	When no argument is provided, it should prompt the user for input.
##•	The script should evaluate whether the argument provided exists as a file or a directory, or doesn't exist at all.
##•	If the argument is a file, the script should give a long listing of the filename.
##•	If the argument is a directory, the script should give a long listing of the directory properties.
##•	If the argument provided doesn't exist as a file or directory, the script should prompt with "Argument doesn't exist," where the text argument needs to be replaced with the actual argument. Also, in this case, this script should stop immediately with exit code 6.

# no argument provided 
if [ -z $1 ]
then
	echo 'no argument is provided, please enter an argument'
	read INPUT1
else
	INPUT1=`echo $1`
fi

# file or directory
if [ -d $INPUT1 ]
then 
	echo $INPUT1 is a directory
	ls -l $INPUT1 
elif [ -f  $INPUT1 ] 
then
	echo $INPUT1 is a file
	ls -l $INPUT1 
else
	echo $INPUT1 does not exist as a file or a directory
	exit 6 
fi
