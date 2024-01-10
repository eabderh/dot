#!/bin/bash


function tmux_markedwindow() {
	tmux list-panes -a \
		-F '#{pane_marked} #{session_name}:#{window_index}' \
		| sed -n 's:1 \(.*\)$:\1:p'
}


# -----------------------------------------------------------------------------

markedwindow="$(tmux_markedwindow)"

if [ "$markedwindow" == "" ]; then
	echo 'no marked window'
	exit 0
fi
tmux move-window -d -s "$markedwindow"

