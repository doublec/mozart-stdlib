#!/bin/sh

case `uname -s` in
    CYGWIN*)
	cygpath -w "$1" | sed 's|\\|/|g'
	;;
    MINGW32*)
        cmd //c echo "$1"	
	;;
    *)
	echo "$1"
	;;
esac
