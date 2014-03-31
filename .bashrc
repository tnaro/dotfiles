#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -Fhx --group-directories-first '
alias ll='ls -la'
PS1='[\u@\h \W]\$ '

alias vi="vim"
alias findmove="find -mindepth 2 -type f -print -exec mv {} . \;"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias kc="ssh stefan@88.198.125.126"
alias syncinfo="watch grep -e Dirty: -e Writeback: /proc/meminfo"
