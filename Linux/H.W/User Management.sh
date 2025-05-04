#!/bin/bash
<<info
This shell script simulate user account management.
info

function check {
	username=$1
	present=$(grep "^$username:" /etc/passwd | wc -l)
	if [ $present -gt 0 ]; then
		return 0
	fi
	return 1

}

function create {
	read -p "Enter username - " username
	read -p "Enter password - " password
	if check "$username"; then
		echo "User $username already exist. Please try with a different username."
	else
		sudo useradd -m "$username"
                echo -e "$password\n$password" | sudo passwd "$username"
                echo "User $username created successfully."
	fi
}

function delete {
	read -p "Enter userrname - " username
	if check "$username"; then
		sudo userdel -r "$username" > /dev/null
		echo "User $username successfully deleted."
	else
		echo "User $username doesn't exist. Please try with a different username."
	fi
}

function reset {
	read -p "Enter username - " username
	if ! check "$username"; then
		echo "User $username doesn't exist. Please try again with a different username."
		return 1
	fi
	read -p "Enter new password - " password
	read -p "Confirm new password - " confirm_password
	if [ "$password" != "$confirm_password" ]; then
		echo "Password don't match. Please try again later."
	else
		echo -e "$password\n$password" | sudo passwd "$username"
                echo "Password reset successful for user $username."
	fi
}

function display {
	echo "USER ID"
	awk -F: '{print $1, $3}' /etc/passwd
}

function help {
	echo "Usage: $0 [options]"
	echo "-c, --create        Create a new user"
   	echo "-d, --delete        Delete an existing user"
    	echo "-r, --reset         Reset the password of an existing user"
    	echo "-l, --list          List all users with their UID"
    	echo "-h, --help          Display this help message"
}


case "$1" in
	-c|--create)
		create
		;;
	-d|--delete)
		delete
		;;
	-r|--reset)
		reset
		;;
	-l|--list)
		display
		;;
	-h|--help)
		help
		;;
	*)
        	echo "Invalid option. Use -h or --help for usage information."
        	;;
esac


