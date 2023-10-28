#!/bin/bash

echo -e "\nWelcome to Interactive File explorer"

while true
do
	echo -e "\n1 - for list directory or files"
	echo "2 - for counting the character from provided text"

	echo ""
	read -p "Enter your Choice (Press Enter for exit): " choice

	if [ -z $choice ]
        then
                break
        fi

	if [ $choice == "1" ]
	then
		while true
		do

			echo ""
			read -p "Enter directory path to list the files of that directpry (Press Enter for exit): " dir

			if [ -z $dir ]
			then
				break
			else
				echo ""
				ls -lh $dir
			fi
		done
	fi

	if [ $choice == "2" ]
	then
		while true
		do

			echo ""
			read -p "Enter a line of text (Press Enter for exit): " text

			if [ -z $text ]
                        then
                                break
                        fi

			echo ""
   		        count=`echo -n $text | wc -c`
			echo "The character count is: $count"
		done
	fi
done
