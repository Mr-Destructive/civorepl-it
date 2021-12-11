#!/usr/bin/env bash

#civo repl.it
read -p "Do you want the latest version? (y/n) : " v
if [[ $v = "y" ]];
then
    repo="https://api.github.com/repos/civo/cli/releases/latest"
    version=$(curl -s $repo | grep -oP '"tag_name": "\K(.*)(?=")')
    vnum="${version#?}"
else
    read -p "Enter the version number : " vnum
    version="v$vnum"
fi 


wget "https://github.com/civo/cli/releases/download/$version/civo-$vnum-linux-amd64.tar.gz"

tar -xvf "civo-$vnum-linux-amd64.tar.gz"
rm "civo-$vnum-linux-amd64.tar.gz"
chmod +x civo
clear
