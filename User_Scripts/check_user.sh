#!/usr/bin/env bash

# Pass in argument of username to check information about in regards to basic user details.

if [[ $# -eq 0 ]]; then
	echo "Please provide a user as an argument."
	exit 1
fi

check=$(getent passwd $1)

if [[ -n "$check" ]]; then	
	groups=$(id $1 | awk -F'groups=' '{print $2}')
	echo -e "Found user"
	echo "$check"
	echo -e "Groups:"
	echo "$groups"
	echo -e "5 most recent sessions:"
	echo "$(last $1 | head -5)"
else 
	echo -e "User not found."
	exit 1	
fi
