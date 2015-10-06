# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-3

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"
alias exp="explorer"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias vbox="VBoxManage.exe "
alias vboxlist="VBoxManage.exe list vms"
alias vboxup="VBoxManage.exe startvm --type headless "
alias mygrep="find . -type f|xargs grep"
# alias vboxdown="VBoxManage.exe controlvm $1 acpipowerbutton"

which cocot > /dev/null 2>&1
if [ $? = 0 ] ; then
    alias ping="cocot ping"
    alias ipconfig="cocot ipconfig"
fi


source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

 # プロンプトに各種情報を表示
 GIT_PS1_SHOWDIRTYSTATE=1
 # GIT_PS0_SHOWUPSTREAM=1
 GIT_PS1_SHOWUNTRACKEDFILES=1
 #GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
 # \u ユーザ名
 # \h ホスト名
 # \W カレントディレクトリ
 # \w カレントディレクトリのパス
 # \n 改行
 # \d 日付
 # \[ 表示させない文字列の開始
 # \] 表示させない文字列の終了
 # \$ $
export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '
#############

export http_proxy=http://172.29.88.132:8080/
export https_proxy=http://172.29.88.132:8080/

export desktop="/cygdrive/c/Users/naokawano/Desktop"
export dt="/cygdrive/c/Users/naokawano/Desktop"
export doc="/cygdrive/c/Users/naokawano/Documents"
export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set ft=man nolist nonu noma' -\""

if [ -d /cygdrive/c ] ; then
    export c=/cygdrive/c/
fi
