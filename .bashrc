# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# Need detect OS for customized configuration
export myconfig_platform='unknown'
export myconfig_os=`uname`
if case ${myconfig_os} in *"Darwin"*) true;; *) false;; esac; then
  export myconfig_platform='mac'
elif case ${myconfig_os} in *"CYGWIN"*) true;; *) false;; esac; then
  export myconfig_platform='cygwin'
else
  echo "Cannot recognize current OS"
fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export PATH=~/usrbin:$PATH

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
set -o notify
#
# Don't use ^D to exit
set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
if [[ $myconfig_platform == 'mac' ]]; then
  alias ls='ls -hFG'                            # classify files in colour
  alias ll='ls -lh'                             # long list
else
  alias ls='ls -hF --color=tty'                 # classify files in colour
  alias ll='ls -l'                              # long list
fi
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

if [[ $myconfig_platform == 'cygwin' ]]; then
  #export FRAMEWORK_3G=/d/picochip/project/Transcede/codeTree/3G-WCDMA/framework_3g
  #export SIMULATION_LIB=/d/picochip/project/Transcede/codeTree/3G-WCDMA/simulation_lib
  export TESTSUITE_ROOT=${FRAMEWORK_3G}/test_suite
  export SIMULATION_LIB=/cygdrive/c/work/src_git_mindspeed/simulation_lib
  #export PICO_DIR_PC82XX=/d/picochip/project/Transcede/codeTree/Systems
  #export PICOSYSTEMS=/d/picochip/project/Transcede/codeTree/Systems

  # if you want to run STM as well, you need to source STM setup file
  #    ${PICOSYSTEMS}/wcdma-systemTest/systemTest_bashrc
  # the following command will setup TCLLIBPATH as below so that all ATA libraries are available to you:
  #    export TCLLIBPATH="${TCLLIBPATH} ${FRAMEWORK_3G}/tools/ata"
  # depending on your setup, you might have to run the following to convert setup file to unix format
  #    dos2unix $FRAMEWORK_3G/tools/ata/ata_bashrc
  #    source ${FRAMEWORK_3G}/tools/ata/ata_bashrc

  export CVSROOT=:pserver:liny@cvs2.picochip.com:/export/home/cvsroot

  #eval `dircolors ~/.dircolors/dircolors.ansi-universal`
  export TERM=cygwin

  #export http_proxy=http://proxy-prc.intel.com:911
  export PATH=~/bin/arm-2010.09/bin:/cygdrive/c/Java/jdk1.7.0_67/bin:$PATH

  export LANG=en

  alias ilab='ssh -X lyang3@10.239.20.120'
  alias liaohe='ssh -X liny@172.16.126.60'
  alias 8l07='ssh -X lin.yang@172.16.124.117'
  alias sonblade='ssh -X yanglin@172.16.126.54'
  alias ab2='ssh -X root@172.16.124.67'

  export EDITOR=/usr/bin/vim

  export CSCOPE_DB="/home/lyang3/.vim/cscope.out"

elif [[ $myconfig_platform == 'mac' ]]; then
  echo "no special configuration for $myconfig_platform"
  #eval `dircolors ~/.dircolors/dircolors.ansi-universal`
  export CSCOPE_DB="/Users/Lin/.vim/cscope.out"

else
  echo "no special configuration for $myconfig_platform"

fi

export DISPLAY=":0.0"
