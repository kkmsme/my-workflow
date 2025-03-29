#!/bin/bash

set -e

git config --global core.editor "vim"

git config --global alias.last "log -1 HEAD" 
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"