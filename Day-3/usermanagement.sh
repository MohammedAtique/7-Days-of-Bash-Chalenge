#!/bin/bash

# Function to display usage information and available options
function script_usage() {
	echo "Usage: ./usermanagement.sh [OPTIONS]"
	echo -e "\nOptions: "
	echo "	-c,  --create -> to create account for new user"
	echo "	-d,  --delete -> to delete the existing user account"
	echo "	-r,  --reset  -> to reset the password of an existing user account"
	echo "	-l,  --list   -> to list all user accounts on the system"
	echo "	-h,  --help   -> to see avaialable options"
	echo ""
}

# Function to create a new user account
function account_creation() {

	read -p "Enter a username for new user: " user

	count=`grep /$user: /etc/passwd | wc -l`

	if [ $count -gt 0 ]; then
		echo -e "\nUsername already exist"
		exit 1
	fi

	read -sp "Enter a password for '$user': " pass
	echo ""

	useradd -m $user -p $pass

	echo -e "\nUser '$user' added successfully"

}

# Function to delete an existing user account
function account_deletion() {

	read -p "Enter username to delete the account of that user: " user

	count=`grep /$user: /etc/passwd | wc -l`

	if [ $count -gt 0 ]; then
		echo -e "\nDeleting the account of user '$user'"
		userdel -r $user
		echo -e "\nUser account '$user' deleted successfully"
	else
		echo -e "\nPlease enter a valid username. Username does not exist"
		exit 1
	fi
}

# Function to reset the password for an existing user account
function password_reset() {

	read -p "Enter the username to change or reset the password: " user

	count=`grep /$user: /etc/passwd | wc -l`

	if [ $count -gt 0 ]; then
		echo -e "\nResetting the password for user '$user'"
		read -sp "Enter new password for user '$user': " pass
		echo -n "$user:$pass" | chpasswd
		echo -e "\nUser account '$user' password changed successfully"
	else
                echo -e "\nPlease enter a valid username. Username does not exist"
                exit 1
	fi

}

# Function to list all user accounts on the system
function list() {

	echo -e "\nAll user account on the system: "

	for user in $(awk -F: '{ print $1 }' /etc/passwd); do
		echo "- $user (UID: $(id -u $user)) (GID: $(id -g $user))"
	done

}

# main script

if [ $# == 0 ] || [ $1 == "-h" -o $1 == "--help" ]; then
	script_usage

elif [ $1 == "-c" -o $1 == "--create" ]; then
	account_creation

elif [ $1 == "-d" -o $1 == "--delete" ]; then
	account_deletion

elif [ $1 == "-r" -o $1 == "--reset" ]; then
	password_reset

elif [ $1 == "-l" -o $1 == "--list" ]; then
        list

else
	echo "Error: Invalid option '$1'. Use '-h' or '--help' to see available options"
fi

