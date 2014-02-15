# ~/.bashrc: executed by bash(1) for non-login shells.

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "["${ref#refs/heads/}"]";
}

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[00m\]\[\033[01;36m\]@\[\033[00m\]\[\033[01;31m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;32m\]\$(git_branch)\[\033[00m\]\$ "
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lAF'
alias la='ls $LS_OPTIONS -A'
alias l='ls $LS_OPTIONS'

# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='colordiff'

xauth merge /home/user/.Xauthority

export SVN_EDITOR=vim
export GIT_EDITOR=vim
