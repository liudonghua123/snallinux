if [ -e ~/.bashrc ] ; then
	source ~/.bashrc
fi

# run startx in linux term
if [[ "$TERM" == "linux" ]] ; then
	echo -n "run startx [Y/n/s/x]? "
	read x
	if [ "$x" == "s" ] ; then
		screen -raAd main || screen -S main
		exit
	elif [ "$x" == "x" ] ; then
		screen -x main || screen -S main
		exit
	elif [ "$x" != "n" ] ; then
		startx
	fi
elif [[ "$TERM" =~ "screen" ]] ; then
	echo "already in screen" >> /dev/null
elif [[ "$TERM" =~ "xterm" ]] ; then
	echo -n "run screen [Y/n/x]? "
	read x
	if [ "$x" == "x" ] ; then
		screen -x main || screen -S main
		exit
	elif [ "$x" != "n" ] ; then
		screen -raAd main || screen -S main
		exit
	fi
fi

