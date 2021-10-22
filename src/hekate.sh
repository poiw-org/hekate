#!/bin/sh

# dependencies a browser, xargs, dmenu

keys=(${1:-$(printf "%s" | dmenu -p 'keycodes: ' | tr ";" "\n")})

command=""
re='^[0-9]0?$'

for item in "${keys[@]}"
do
case $item in
	m) command="$command -new-tab -url https://webmail.edu.hmu.gr/?_task=mail^&_mbox=INBOX" ;;
	e) command="$command -new-tab -url https://eclass.hmu.gr/modules/auth/cas.php" ;;
	s) command="$command -new-tab -url https://students.hmu.gr/" ;;
	E) command="$command -new-tab -url https://service.eudoxus.gr/student/api/studentDetails" ;;
	p) command="$command -new-tab -url https://ece.hmu.gr/proptyxiakes/wrologio-programma-mathhmatwn/" ;;
	P) command="$command -new-tab -url https://ece.hmu.gr/proptyxiakes/programma-spoydwn/" ;;
	H) command="$command -new-tab -url https://ece.hmu.gr" ;;
	S) command="$command -new-tab -url https://secretariat.hmu.gr/auth/login.html" ;;
	M) command="$command -new-tab -url https://www.hmu.gr/merimna/" ;;
	C) command="$command -new-tab -url https://idp.hmu.gr/cas/login" ;;
	l) command="$command -new-tab -url https://lib.hmu.gr/en/home/" ;;
	b) command="$command -new-tab -url https://service.eudoxus.gr/public/departments#48" ;;
	k) command="$command -new-tab -url https://repository.kallipos.gr/" ;;
	h) command="$command -new-tab -url https://www.heal-link.gr/" ;;
	i) command="$command -new-tab -url https://www.hmu.gr/el/hmu/9957" ;;
	\?) notify-send "Hekate" "GNU GPL v3"; exit 0 ;;
esac

if [[ $item =~ $re ]] ; then
	command="$command -new-tab -url http://opencourses-stream.hmu.gr/liveapp/live_viewer-old.php?cid=$item" ;
fi

done

if [ -z "$command" ];
then
	notify-send "Hekate" "No valid input was entered";
	exit 1
fi

echo $command | xargs flatpak run org.mozilla.firefox &
