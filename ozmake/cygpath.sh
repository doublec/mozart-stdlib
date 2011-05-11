#!/bin/sh

case `uname -s` in
    CYGWIN*)
	cygpath -w "$1" | sed 's|\\|/|g'
	;;
    MINGW32*)
        pathname=`cmd //c echo "$1"`
	case "$pathname" in
	    ?:* )
		device=`expr substr "$pathname" 1 1 | tr '[:upper:]' '[:lower:]'`
		pathname=`expr "$pathname" : '.\(:.*\)$'`
		pathname="$device$pathname"
        esac
        echo "$pathname"
        
	;;
        
    *)
	echo "$1"
	;;
esac
