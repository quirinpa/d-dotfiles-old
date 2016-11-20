#!/bin/sh

set -e
xset fp+ ~/.fonts
gpg-connect-agent /bye
source $HOME/.xres/apply
if [ -z $THIN ]; then
	# if [[ $(hostname) == "qant" ]]; then
	# 	synclient TouchpadOff=1 FingerHigh=40 PalmDetect=1
	#   syndaemon -i 2 -d
	# fi

	# dunst &
	feh --bg-fill $HOME/.wallpapers/RuRa.jpg
	unclutter &
	urxvtd &
	$HOME/bin/panel.sh &
	sxhkd &
	redshift -t 5700:3500 &
	# crond -f $HOME/.crontab
	exec bspwm
else
	THIN= exec urxvt
fi
