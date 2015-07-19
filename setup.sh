#!/bin/bash
INSTALL_PATH=$HOME/.dotfiles
BASHRC=$HOME/.bashrc

# install git
sudo apt-get update
sudo apt-get install git

# clone repo
if [ ! -d INSTALL_PATH ] ;
then
    echo "Cloning dotfiles to $INSTALL_PATH"
    git clone https://github.com/manuelcarrizo/dotfiles.git $INSTALL_PATH
fi

# install packages
cd $INSTALL_PATH
echo "Installing packages"
apt/install.sh


# add aliases to bashrc
echo "Adding aliases to bashrc"
LINE="source $INSTALL_PATH/aliases/all.sh"
FOUND=`cat $BASHRC | grep "$LINE" | wc -l`

if [ $FOUND = 0 ] ;
then
    echo "" >> $BASHRC
    echo $LINE >> $BASHRC
else
    echo "Line already added to $BASHRC"
fi

echo "Done"
