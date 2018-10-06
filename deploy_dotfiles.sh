#!/bin/bash

# set up pathname
Home="/home/chitsutote"
Destin="/home/chitsutote/Desktop/cloneRepo/dotfiles"

cp $Destin/vimrc $Home/.vimrc 
cp $Destin/gitconfig $Home/.gitconfig 
cat $Destin/bashrc >> $Home/.bashrc 
