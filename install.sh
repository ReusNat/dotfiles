#!/bin/bash

link() {
    rm -f ~/.vimrc ~/.inputrc
    ln -sf .dotfiles/.vimrc ~/.vimrc
    ln -sf .dotfiles/.inputrc ~/.inputrc
    if [ -f "$HOME/.bash_profile" ] ; then
        ln -sf ~/.dotfiles/.profile ~/.bash_profile
    else 
        ln -sf ~/.dotfiles/.profile ~/.profile
    fi
}

unlink() {
    rm -f ~/.vimrc ~/.inputrc
    cp ~/.dotfiles/.vimrc ~/.vimrc
    cp ~/.dotfiles/.inputrc ~/.inputrc
    if [ -f "$HOME/.bash_profile" ] ; then
        cp ~/.dotfiles/.profile ~/.bash_profile
    else 
        cp ~/.dotfiles/.profile ~/.profile
    fi
}

# ./install.sh link
# ./install.sh unlink

if [[ $# -ne 1 ]]; then
    echo "$0 (link|unlink)"
    exit 1
fi

if [[ $1 != "link"  && $1 != "unlink" ]]; then
    echo "Invalid subcommand $1"
    echo "$0 (link|unlink)"
    exit 1
fi

$1

