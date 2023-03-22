#!/bin/bash
shopt -s dotglob

wd=$(pwd)
for file in *; do 
	if ! [[ "$file" =~ ^(link.sh|.git)$ ]]; then
		ln -s -f $wd/$file ~/$file
	fi
done

find .config/ -print0 | while IFS= read -r -d '' file
do 
	ln -s -f $wd/$file ~/$file
done
