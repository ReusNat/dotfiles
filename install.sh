#!/bin/bash

link() {
    rm -f ~/.vimrc ~/.inputrc
    ln -sf .dotfiles/.vimrc ~/.vimrc
    ln -sf .dotfiles/.inputrc ~/.inputrc
    ln -sf ~/.dotfiles/.profile ~/.profile
}

unlink() {
    rm -f ~/.vimrc ~/.inputrc
    cp ~/.dotfiles/.vimrc ~/.vimrc
    cp ~/.dotfiles/.inputrc ~/.inputrc
    cp ~/.dotfiles/.profile ~/.profile
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

