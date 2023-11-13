# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH for cuda 10.0 installation
if [ -d "/usr/local/cuda-10.0/bin/" ]; then
    export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

alias enrun='source env/bin/activate'

alias c="clear"
alias cl="clear && ls"
alias ll="ls -al"
alias sl="sl -aeF"
alias lt="ls -latr"
alias vi="vim"

#open.sh
#bff.sh
# export PATH=$HOME/bin:$PATH see line 20

cpp () {
    prefix=$1
    g++ $prefix.cpp -o $prefix -fmax-errors=1
    if [[ $? -eq 0 ]] ; then
	    ./$prefix
    fi
}

C () {
    prefix=$1
    gcc $prefix.c -o $prefix -fmax-errors=1
    if [[ $? -eq 0 ]] ; then
	    ./$prefix
    fi
}

r () {
    prefix=$1
    rustc $prefix.rs
    if [[ $? -eq 0 ]] ; then
	    ./$prefix
    fi
}


#if [ -f "$HOME/.links/bad-links.txt" ] ; then
#	cat $HOME/.links/bad-links.txt
#fi

# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
