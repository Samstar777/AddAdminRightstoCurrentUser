#!/bin/bash

#Creator : Salim Ukani AKA Samstar
#Creation Date : 19th May 2023
# This script will fetch currentUser id and check if current user is Admin, If not than it will add admin rights to currentUser account.

currentUser=$(who | awk '/console/{print $1}')

#Check if currentUser is an admin
IsCurrentUserAdmin=$(dseditgroup -o checkmember -m "$currentUser" admin | awk '{print $1}')

#Adding CurrentUser to admin group
if [ $IsCurrentUserAdmin == "no" ]; then
	echo "Adding Admin Rights to $currentUser user"
	/usr/sbin/dseditgroup -o edit -a $currentUser admin
else 
	echo "$currentUser is Admin"
fi

