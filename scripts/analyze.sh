#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
if [[ $# -eq 0 ]]; then
	echo "Usage"
	exit 1
fi

# TODO: validate file existence
file=$1
if [[ ! -f "$file" ]] ; then
	echo "No file"
	exit 1
fi

# TODO: print:
# Total ERROR: <number>
count=$( grep -c "ERROR" "$file")
echo "Total ERROR: $count"
# Top Code: <code>
top=$(grep "ERROR" "$file" | grep -o "code=[0-9]*" | cut -d"=" -f2 | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')
echo "Top Code: $top"
exit 0
