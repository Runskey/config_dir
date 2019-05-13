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

alias ls='ls --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
# special alias for ls and ll is not needed on mac since the standard GNU toolset is used from macport
# # Some shortcuts for different directory listings
# if [[ $myconfig_platform == 'mac' ]]; then
#   alias ls='ls -hFG'                            # classify files in colour
#   alias ll='ls -lh'                             # long list
# else
#   alias ls='ls --color=tty'                 # classify files in colour
#   alias ll='ls -l'                              # long list
# fi
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #



########################################################
# environment-specific settings
########################################################

# virtual machine
alias vub='ssh -Y lin@vub.local' # username:lin password:l

# cloud server for blockchain
alias tonode0="ssh -Y root@node0"
alias tonode1="ssh -Y root@node1"
alias tonode2="ssh -Y root@node2"
alias tonode3="ssh -Y ubuntu@node3"
alias tonode4="ssh -Y ubuntu@node4"
alias tonode5="ssh -Y ubuntu@node5"

alias toainode="ssh -Y ubuntu@ainode"

# Intel work
alias ilab='ssh -Y lyang3@10.239.20.120'
alias liaohe='ssh -Y liny@172.16.126.60'
alias 8l07='ssh -Y lin.yang@172.16.124.117'
alias sonblade='ssh -Y yanglin@172.16.126.54'

alias enbs='ssh -Y root@172.16.124.67'
alias epcs='ssh -Y root@172.16.124.115'
alias mecs='ssh -Y root@172.16.124.69'
alias chunmingmec='ssh -Y root@10.240.224.186'
alias hefanepc='ssh -Y root@10.240.224.180'
alias hefanenb='ssh -Y root@10.240.224.166'
alias sktepc="ssh -Y root@10.240.224.204"
alias sktenb="ssh -Y root@10.240.224.211"
alias sktmec="ssh -Y root@10.240.224.214"
alias sktgui="ssh -Y traffic-server@10.240.224.210"
alias ueserver="ssh -Y root@10.240.224.236"

alias polaris="ssh -Y intel@172.27.4.10"

alias get_chain_log_main="scp -r ubuntu@ainode:/var/www/html/ACG/main/acg_chain.log ./acg_chain_main.log"
alias get_chain_log_admin="scp -r ubuntu@ainode:/var/www/html/ACG/AdminPage/acg_chain.log ./acg_chain_admin.log"




