#!/bin/bash

echo -e "Task 1: Comments\n"

# Here is the comment for testing

echo -e "Task 2: Echo"

echo "This is my sample message using echo command"

echo -e "\nTask 3: Varibales"

a=5

echo "Here variable is (a) and it's value is $a"

echo -e "\nTask 4: Using Variables"

read -p "Enter 1st number: " num1

read -p "Enter 2nd number: " num2

echo "The sum of two number is $(($num1+$num2))"

echo -e "\nTask 5: Using Built-in Variables"

echo "\$USER uses to show the current USER - $USER"
echo "\$PWD uses to show the current path - $PWD"
echo "\$PATH uses to show environment variable - $PATH"

echo -e "\nTask 6: Wildcards"

echo "find command is used to find things in directory"

read -p "Enter directory path to find: " dirpath
read -p "ENter extension to search: " ext

echo -e "\n" `find $dirpath -name *.$ext`
