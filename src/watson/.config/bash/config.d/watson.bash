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

function wedit() {
	watson edit "$@"
}

function wlog() {
	ARGS="$@"
	if [ $# -eq 0 ]; then
		ARGS="--day"
	fi
	watson log "$ARGS"
}

function whis() {
	ARGS="$@"
	if [ $# -eq 0 ]; then
		ARGS="--day"
	fi
	watson report "$ARGS"
}

