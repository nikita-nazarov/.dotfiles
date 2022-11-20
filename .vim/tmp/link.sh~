#!/bin/bash
shopt -s dotglob

wd=$(pwd)
for FILE in *; do 
	if ! [[ "$FILE" =~ ^(link.sh|.git)$ ]]; then
		ln -s -f $wd/$FILE ~/$FILE
	fi
done
