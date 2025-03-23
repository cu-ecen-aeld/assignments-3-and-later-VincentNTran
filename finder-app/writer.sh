#/bin/sh

if [ $# -ne 2 ]
then
	echo "Error: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
	echo "Arguments received: $#"
	echo "The order of arguments should be:"
	echo "	1) Full path to a file"
	echo "	2) Text string to be written"

	exit 1
else
	WRITEFILE=$1
	WRITESTR=$2
fi

if [ ! -d $WRITEFILE ]
then
	mkdir -p $(dirname $WRITEFILE) 
	if [ $? -ne 0 ]
	then
		echo "File could not be created"
	fi
fi

echo "$WRITESTR" > $WRITEFILE
