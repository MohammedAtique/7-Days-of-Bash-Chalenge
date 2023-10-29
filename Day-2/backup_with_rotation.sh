#!/bin/bash

echo -e "\nThis script helps to take backup\n"

if [ $# -eq 0 ]; then
	echo "Usage: ./backup_with_rotation.sh 'path of directory'"
	exit
fi

newdir="/home/ubuntu/backup/backup_$(date +'%y-%m-%d-%H-%M-%S')"

mkdir -p $newdir

cp -r $1/* $newdir

#count=`ls -t /home/ubuntu/backup/ | grep 'backup_*' | wc -l`

while true; do

	count=`ls -t /home/ubuntu/backup/ | grep 'backup_*' | wc -l`

	if [ $count -gt 3 ]; then
		rem=`ls -t /home/ubuntu/backup/ | grep 'backup_*' | tail -1`
                yes | rm -r /home/ubuntu/backup/$rem
	else
		break
	fi
done

echo "Backup Created: $newdir"
