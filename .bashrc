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
    then
    export TERM="xterm-256color"
fi

# Java
export JAVA_HOME=/home/constantine/jdk1.7.0_51
export PATH=$PATH:/home/constantine/jdk1.7.0_51/bin


# RAM usage
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}


