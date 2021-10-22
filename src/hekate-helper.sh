#!/bin/sh

# dependencies a browser, xargs, dmenu

key="$(printf "m | https://webmail.edu.hmu.gr/?_task=mail^&_mbox=INBOX\\ne | https://eclass.hmu.gr/modules/auth/cas.php\\ns | https://students.hmu.gr/\\nE | https://service.eudoxus.gr/student/api/studentDetails\\np | https://ece.hmu.gr/proptyxiakes/wrologio-programma-mathhmatwn/\\nP | https://ece.hmu.gr/proptyxiakes/programma-spoydwn/\\nH | https://ece.hmu.gr\\nS | https://secretariat.hmu.gr/auth/login.html\\nM | https://www.hmu.gr/merimna/\\nC | https://idp.hmu.gr/cas/login\\nl | https://lib.hmu.gr/en/home/\\nb | https://service.eudoxus.gr/public/departments#48\\nk | https://repository.kallipos.gr/\\nh | https://www.heal-link.gr/\\ni | https://www.hmu.gr/el/hmu/9957\\n? | license\\nn | http://opencourses-stream.hmu.gr/liveapp/live_viewer-old.php?cid=n" | dmenu -l 10 -p "keycode: " | cut -c1-1)"

command=""

case $key in
	m) command="-new-tab -url https://webmail.edu.hmu.gr/?_task=mail^&_mbox=INBOX" ;;
	e) command="-new-tab -url https://eclass.hmu.gr/modules/auth/cas.php" ;;
	s) command="-new-tab -url https://students.hmu.gr/" ;;
	E) command="-new-tab -url https://service.eudoxus.gr/student/api/studentDetails" ;;
	p) command="-new-tab -url https://ece.hmu.gr/proptyxiakes/wrologio-programma-mathhmatwn/" ;;
	P) command="-new-tab -url https://ece.hmu.gr/proptyxiakes/programma-spoydwn/" ;;
	H) command="-new-tab -url https://ece.hmu.gr" ;;
	S) command="-new-tab -url https://secretariat.hmu.gr/auth/login.html" ;;
	M) command="-new-tab -url https://www.hmu.gr/merimna/" ;;
	C) command="-new-tab -url https://idp.hmu.gr/cas/login" ;;
	l) command="-new-tab -url https://lib.hmu.gr/en/home/" ;;
	b) command="-new-tab -url https://service.eudoxus.gr/public/departments#48" ;;
	k) command="-new-tab -url https://repository.kallipos.gr/" ;;
	h) command="-new-tab -url https://www.heal-link.gr/" ;;
	i) command="-new-tab -url https://www.hmu.gr/el/hmu/9957" ;;
	\?) notify-send "Hekate" "GNU GPL v3"; exit 0 ;;
esac

if [[ $key == "n" ]] ; then
	key="$(printf "1 | Kamari\\n2 | SEYP\\n3 | D\\n4 | G\\n5 | F/X\\n6 | Agro\\n7 | sminarion SDO\\n8 | Amfitheatro 5\\n9 | Amfitheatro E SEY" | dmenu -l 10 -p "keycode: " | cut -c1-1)";
	if [ -z "$key" ];
	then
		exit 1
	fi

	command="-new-tab -url http://opencourses-stream.hmu.gr/liveapp/live_viewer-old.php?cid=$key" ;
fi

if [ -z "$command" ];
then
	exit 1
fi
echo $command | xargs firefox &
