#!/bin/bash

function ww() {
	watson "$@"
}

function ws() {
	watson status "$@"
}

function wt() {
	watson start "$@"
}

function we() {
	watson edit "$@"
}

function wlog() {
	ARGS="$@"
	if [ $# -eq 0 ]; then
		ARGS="--day"
	fi
	watson log $ARGS
}

function whis() {
	ARGS="$@"
	if [ $# -eq 0 ]; then
		#ARGS="-f $(date +%F)"
		watson report --day
		return 0
		#ARGS="--day"
	fi
	# TODO: watson prints via 'click' python library, which only prints colors
	# when connected to a terminal:
	# (https://click.palletsprojects.com/en/8.0.x/utils/#ansi-colors)
	# to force it to use colors, we have to make watson think it is connected
	# to a terminal instead of a pipe or other. 'less' messes up when the
	# output is piped to it, so a temp file is used instead.
	#less -f <(
	watson aggregate --no-pager $ARGS
	watson report --no-pager $ARGS
		#script --return --quiet -c "watson aggregate --no-pager $ARGS"
		#script --return --quiet -c "watson report --no-pager $ARGS"
	#)
}

