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
# Aliases
alias netbeans="$HOME/netbeans-8.0/bin/netbeans"
alias pycharm="$HOME/pycharm-community-3.1.1/bin/pycharm.sh"
alias phpstorm="$HOME/PhpStorm-133.982/bin/phpstorm.sh"
alias chrom="chromium & exit"
alias reboot="sudo shutdown -r now"
alias shutdown="sudo shutdown -h now"
alias crawl="sudo /usr/games/bin/crawl"
alias commit="git commit -m "
alias push="git push "
alias mtar="tar -zcvf "
alias utar="tar -zxvf "

# 256 colors
if [ "x$TERM" = "xxterm" ]
    then
    export TERM="xterm-256color"
fi


# Java
export JAVA_HOME=$HOME/jdk1.7.0_45
export PATH=$PATH:$HOME/jdk1.7.0_45/bin
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin

# Ruby

export PATH=$HOME/.rbenv/bin:$PATH
export RUBYOPT=""


 #RAM usage
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

