#!/usr/bin/env python
"""MPD lyrics script
   Usage: `python mpdlyrics' or `./mpdlyrics'
   Requires: mpc

ChangeLog:
- `replace' argument handles UnicodeEncodeError
- Terminal variable
- Python-3 compatibile
"""

import os
try:
  import urllib.request
  urlopen = urllib.request.urlopen
except ImportError:
  import urllib
  urlopen = urllib.urlopen

splitter = '()()'
lyrstartstr = b'<div id="lyrics">'
lyrendstr = b'</div>'

def execute(cmd):
  a = os.popen(cmd)
  return a.readlines()

# get artist and title
mpcoutput = execute(
              'mpc --format "%artist%' + splitter + '%title%"'
            )[0].split(splitter)

# parses title and artist
title = mpcoutput[1].strip()
artist = mpcoutput[0].strip()
title_ = title.replace(' ', '%20')
artist_ = artist.replace(' ', '%20')

# fetch lyrics
html = urlopen(
         'http://www.lyricsplugin.com/winamp03/plugin/?artist=' + 
         artist_ + '&title=' + title_
       ).read()

# start and end position of lyrics at html-file
lyrstart = html.find(lyrstartstr)
lyrstart = lyrstart + len(lyrstartstr)
lyrend = html.find(lyrendstr, lyrstart)

# put lyrics in lyrics-variable
lyrics = html[lyrstart:lyrend].strip()

# little string manipulation
lyrics = lyrics.replace(b'<br />', b'').replace(b'"', b'"').strip()

##
# Opens new gnome-terminal titled "MPD Lyrics" and executes vim in read-only mode
execin = 'gnome-terminal -t "MPD Lyrics" -x vim -R'

# Opens new xfce4-terminal titled "<artist> - <title>" and executes less
#execin = 'terminal -T "%s - %s" -x less' %(artist, title)
##

if execin == "":
  print("lyrics")
else:	
  lyrfile = open("/tmp/lyrtmp", 'w')
  lyrfile.write(lyrics.decode("utf-8", "replace"))
  lyrfile.close
  os.system(execin + " /tmp/lyrtmp")
