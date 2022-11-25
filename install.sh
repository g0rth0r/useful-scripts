#!/bin/bash

mkdir -p ~/bin

cp ./data-hoarding/yt-* ~/bin
cp ./data-hoarding/*.sh ~/bin 
cp ./shell/* ~/bin

export PATH=$PATH:~/bin

