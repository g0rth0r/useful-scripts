#!/bin/bash

mkdir -p ~/bin

cp ./data-hoarding/yt-* ~/bin
cp ./data-hoarding/*.sh ~/bin 
cp ./shell/* ~/bin

cat ./os-files/.bash_aliases >>~/.bash_aliases

export PATH=$PATH:~/bin

