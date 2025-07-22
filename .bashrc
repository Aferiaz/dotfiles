# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
export MANPATH="$HOME/.local/share/man:$MANPATH"
export MANPAGER="nvim -c 'set ft=man' -c 'nnoremap q :q<CR>' +Man!"

# NOTE: For Private Credentials
if [ -f ~/.private/.bash_private ]; then
    source ~/.private/.bash_private
fi

# NOTE: For better shell experience
fastfetch

# NOTE: To avoid accidental exit via <C-d>
IGNOREEOF=9999
