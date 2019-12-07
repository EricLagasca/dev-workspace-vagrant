# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
if [ -z "$TMUX" ]; then
    if [ -d "$HOME/bin" ]; then
        export PATH="$HOME/bin:$PATH"
    fi

    if [ -d "$HOME/.local/bin" ]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi

    # add and enable pyenv, if existing
    if [ -d "$HOME/.pyenv" ]; then
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"

        if command -v pyenv 1>/dev/null 2>&1; then
            eval "$(pyenv init -)"
        fi
    fi

fi

PS1="${debian_chroot:+($debian_chroot)}\e[1;30m\h [\e[m \e[34m\W\e[m \e[1;30m]\e[m \n\$ "
