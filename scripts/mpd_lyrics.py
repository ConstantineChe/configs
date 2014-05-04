#!/usr/bin/env python

import os,urllib

artist,title = os.popen('mpc --format "%artist%//%title%" | head -n1').read().split("//")

artist = artist.replace(" ","%20")
title = title.replace(" ","%20")
# Get html
html = urllib.urlopen("http://www.lyricsplugin.com/winamp03/plugin/?artist=%s&title=%s"%(artist,title)).read()
lyrstart = html.find('<div id="lyrics">') + 17
lyrend = html.find('</div>',lyrstart)
lyrics = html[lyrstart:lyrend].strip()
# remove html formatting
lyrics = lyrics.replace('<br />','' ).replace('"', '"').strip()
# and dos line feeds
lyrics = lyrics.replace('\r','')
print(lyrics)
