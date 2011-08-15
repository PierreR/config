# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/pierre/.zshrc'

autoload -Uz compinit
# setup a nice prompt
source ~/config/zsh_prompt
# autoload -U colors && colors
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install

export GREP_OPTIONS='--exclude=\*.svn\*'
export EDITOR=vim
export TERM=xterm-256color
# export JDK_HOME=~/build/jdk1.7.0
export JDK_HOME=/opt/java
export JAVA_HOME=~/build/jdk1.6.0_26
# export BMOB_DIR=~/projects/bmob
# export MOZILLA_CERTIFICATE_FOLDER=~/.mozilla/firefox/djt0wc2v.default
# export DJANGO_SETTINGS_MODULE='settings'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt histignoredups
setopt histignorealldups
setopt autocd
setopt histverify
bindkey -e
# Use gvim exclusively
alias vim='gvim'
# alias vim='vim --servername VIM'
alias vi='gvim --remote-silent'
alias ls='ls --color=auto'
alias la='ls -lah --color'
alias du='du -h'
alias lfile="ls -lah *(.)"
alias ldir="ls -ladh (\.*|*)(/,@)"
alias df="df -h"

alias __reload_zsh='source ~/.zshrc'
alias __mount_usb='sudo mount /dev/sdb /mnt/usb' 
# alias close_laptop='xrandr --output LVDS1 --off --output VGA1 --auto'
# alias open_laptop='xrandr --output LVDS1 --auto --output VGA1 --auto --right-of LVDS1'
# alias cd_django='cd $BMOB_DIR'
#PROMPT='%~ %% '
# PROMPT="%{$fg[yellow]%}@%M%{$reset_color%} %~ %% "
# alias ssh_bmob='ssh 192.168.34.51'
# alias __connect_to_staging='cd_django;ssh -i private_key pmobilite@192.168.15.66'
#alias emacs='emacs --fullscreen'
# alias __change_title='printf \\\\033]0\\;\\%s\\\\007 "$1"'
# alias netbeans='netbeans --laf com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
# alias __etags="cd_django;find . -type f -iname '*.py' | etags.emacs --lang=python -"
#alias __ie_6='vncviewer ci10560'
# alias __lock_pc="xscreensaver-command -lock"
# cdpath+=(~/projects/)
# This is better moved in .zshenv
# path+=(/opt/java/bin ~/bin /usr/local/bin)

