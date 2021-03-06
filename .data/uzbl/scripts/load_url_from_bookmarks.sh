#!/bin/bash
bookmarks_file=$XDG_DATA_HOME/uzbl/bookmarks

COLORS=" -nb #303030 -nf khaki -sb #CCFFAA -sf #303030"
OPTIONS=" -i -l 10"

goto=`sort $bookmarks_file | dmenu $OPTIONS $COLORS | cut -d ' ' -f -100  | awk '{print $NF}'`

[ -n "$goto" ] && echo "uri $goto" > $4
