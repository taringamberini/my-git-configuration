#!/bin/bash

cd ~

INSTALL_DIR=git-my-conf
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_DIR="$INSTALL_DIR-backup-$DATE"


echo "Checking for previous git configuration"
if [ -f ~/.gitconfig ] || [ -d ~/$INSTALL_DIR ]
then
	echo "You already have an existing git configuration"
	echo -n "Trying to back it up in ~/$BACKUP_DIR ... "
    mkdir ~/$BACKUP_DIR
	mv ~/.gitconfig ~/$BACKUP_DIR
	mv ~/$INSTALL_DIR ~/$BACKUP_DIR
	echo "success"
fi


echo "Installing git configuration in ~/$INSTALL_DIR"

echo "Cloning my git configuration from GitHub in ~/$INSTALL_DIR"
git clone https://github.com/taringamberini/my-git-configuration.git ~/$INSTALL_DIR

echo -n "Creating symlink ... "
ln -s ~/$INSTALL_DIR/gitconfig ~/.gitconfig
echo "success"

echo "git installation completed :-)"

