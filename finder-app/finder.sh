#!/bin/sh


if [ $# -ne 2 ]
then
	echo "Error: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
	echo "Arguments received: $#"
	echo "The order of the arguments should be:"
	echo "	1) File Directory Path."
	echo "	2) String to be searched in the specified directory path."

	exit 1
else
	FILESDIR=$1
	SEARCHSTR=$2
fi

# Check if directory exists
if [ ! -d $FILESDIR ]
then
	echo "File Directory Path does not represent a directory on the filesystem."
	echo "$FILESDIR"
	exit 1
fi

FILESCOUNT=$(grep -lor "$SEARCHSTR" $FILESDIR/* | wc -l)
MATCHCOUNT=$(grep -or "$SEARCHSTR" $FILESDIR/* | wc -l)

echo "The number of files are $FILESCOUNT and the number of matching lines are $MATCHCOUNT"
