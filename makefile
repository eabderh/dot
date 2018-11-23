

default: room link
all: room link setup

link:
	./link.sh ~
room:
	./room.sh ~

setup:
	git submodule init
	git submodule update

