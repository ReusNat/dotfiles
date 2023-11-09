# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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

alias dev="cd /class/devops"

alias c="clear && ls"
alias cl="clear && ls"
alias ll="ls -al"
alias sl="sl -aeF"
alias lt="ls -latr"

C () {
    prefix=$1
    g++ $prefix.cpp -o $prefix
    if [[ $? -eq 0 ]] ; then
	    ./$prefix
    fi
}
