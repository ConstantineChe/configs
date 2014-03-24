# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
#####################################################################
#========================== Aliases =================================
#####################################################################
#=========================Local aliases==============================
#============================ Work ==================================
#alias netbeans="/home/constantine/netbeans-8.0/bin/netbeans & exit"
#alias phpstorm="/home/constantine/PhpStorm-133.803/bin/phpstorm.sh"
#============================ Home ==================================
#alias netbeans="/home/coon/netbeans-8.0/bin/netbeans & exit"
#alias pycharm="/path/to/pycharm.sh"
#alias phpstorm="/home/constantine/PhpStorm-133.803/bin/phpstorm.sh"
#====================================================================
alias chrom="chromium & exit"
alias reboot="sudo shutdown -r now"
alias shutdown="sudo shutdown -h now"
alias crawl="sudo /usr/games/bin/crawl"
####################################################################

###### 256 colors #########
if [ "x$TERM" = "xxterm" ]
    27 then
    28         export TERM="xterm-256color"
    29     fi

