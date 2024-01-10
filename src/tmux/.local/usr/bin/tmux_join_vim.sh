#!/bin/bash


function tmux_markedpane_process() {
	tmux list-panes -a \
		-F '#{pane_marked} #{pane_current_command}' \
		| sed -n 's:1 \(.*\)$:\1:p'
}

function tmux_markedpane() {
	tmux list-panes -a \
		-F '#{pane_marked} #{session_name}:#{window_index}.#{pane_index}' \
		| sed -n 's:1 \(.*\)$:\1:p'
}

# -----------------------------------------------------------------------------

markedpane="$(tmux_markedpane)"


if [ "$markedpane" == "" ]; then
	echo 'no marked pane'
	exit 0
fi

if [ "$(tmux_markedpane_process)" != "vim" ]; then
	echo "marked pane not running vim: <$(tmux_markedpane_process)>"
	exit 0
fi

tmux send-key -t $markedpane $':wa\n'
tmux send-key -t $markedpane $':mksession /tmp/test.vim\n'
tmux send-key -t $markedpane $':q!\n'

while [ "$(tmux_markedpane_process)" == "vim" ]; do
	sleep '0.1s'
done


tmux send-key $':source /tmp/test.vim\n'
rm /tmp/test.vim

tmux select-pane -M



#tmux move-window -d -s "$markedwindow"
#
