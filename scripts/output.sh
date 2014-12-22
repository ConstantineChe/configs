#!/bin/bash
if xrandr | grep -q "VGA1 connected"
then
    xrandr --output VGA1 --auto --primary --output eDP1 --auto --right-of VGA1
    i3-msg 'workspace "1: Skype"'
    i3-msg 'move workspace to output eDP1'
    i3-msg 'layout tabbed'
    i3-msg 'workspace "2: bash"'
    i3-msg 'move workspace to output eDP1'
    i3-msg 'workspace "3: Web"'
    i3-msg 'move workspace to output eDP1'
    i3-msg 'workspace "4: IDE"'
    i3-msg 'move workspace to output VGA1'
    i3-msg 'layout tabbed'
    i3-msg 'workspace "5: Chromium"'
    i3-msg 'move workspace to output VGA1'
    i3-msg 'workspace "6: emacs"'
    i3-msg 'move workspace to output eDP1'
    i3-msg 'workspace "10: mail"'
    i3-msg 'move workspace to output eDP1'
else
    xrandr --auto
    i3-msg 'workspace "1: Skype"'
    i3-msg 'layout tabbed'
    i3-msg 'workspace "4: IDE"'
    i3-msg 'layout tabbed'
fi
