#!/bin/bash
files={.inputrc .vimrc}
scripts={ghlink gitclone makeflask makehtml prettyzip}

link_scripts() {
    for script in ${scripts[@]}; do
        ln -sf .dotfiles/$script ~/bin/$script
        chmod 700 ~/.dotfiles/$script
    done
}

unlink_scripts() {
    for script in ${scripts[@]}; do
        cp -sf .dotfiles/$script ~/bin/$script
        chmod 700 ~/bin/$script
    done
}

link() {
    rm -f ~/.vimrc ~/.inputrc
    ln -sf .dotfiles/.vimrc ~/.vimrc
    ln -sf .dotfiles/.inputrc ~/.inputrc
    if [ -f "$HOME/.bash_profile" ] ; then
        ln -sf ~/.dotfiles/.profile ~/.bash_profile
    else 
        ln -sf ~/.dotfiles/.profile ~/.profile
    fi
    ln vimrc.html ~/.vimrc.html
    if [ -e ~/.vim ] ; then
        ln html.vim ~/.vim/indent/html.vim
    else
        mkdir ~/.vim ~/.vim/indent
        ln html.vim ~/.vim/indent/html.vim
    fi
    link_scripts
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
    
    cp vimrc.html ~/.vimrc.html
    if [ -e ~/.vim ] ; then
        cp html.vim ~/.vim/indent/html.vim
    else
        mkdir ~/.vim ~/.vim/indent
        cp html.vim ~/.vim/indent/html.vim
    fi
    link_scripts
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

