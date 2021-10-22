#!/usr/bin/env python3

import os
keys = input("Keycodes: ").split(';')
command=''
i = range(1,11)

for item in keys:
    if item=='m':
        command=f"{command} -new-tab -url https://webmail.edu.hmu.gr/?_task=mail^&_mbox=INBOX"
    elif item=='e':
        command=f"{command} -new-tab -url https://eclass.hmu.gr/modules/auth/cas.php"
    elif item=='s':
        command=f"{command} -new-tab -url https://students.hmu.gr/"
    elif item=='E':
        command=f"{command} -new-tab -url https://service.eudoxus.gr/student/api/studentDetails"
    elif item=='p':
        command=f"{command} -new-tab -url https://ece.hmu.gr/proptyxiakes/wrologio-programma-mathhmatwn/"
    elif item=='P':
        command=f"{command} -new-tab -url https://ece.hmu.gr/proptyxiakes/programma-spoydwn/"
    elif item=='H':
        command=f"{command} -new-tab -url https://ece.hmu.gr"
    elif item=='S':
        command=f"{command} -new-tab -url https://secretariat.hmu.gr/auth/login.html"
    elif item=='M':
        command=f"{command} -new-tab -url https://www.hmu.gr/merimna/"
    elif item=='C':
        command=f"{command} -new-tab -url https://idp.hmu.gr/cas/login"
    elif item=='l':
        command=f"{command} -new-tab -url https://lib.hmu.gr/en/home/"
    elif item=='b':
        command=f"{command} -new-tab -url https://service.eudoxus.gr/public/departments#48"
    elif item=='k':
        command=f"{command} -new-tab -url https://repository.kallipos.gr/"
    elif item=='h':
        command=f"{command} -new-tab -url https://www.heal-link.gr/"
    elif item=='i':
        command=f"{command} -new-tab -url https://www.hmu.gr/el/hmu/9957"
    elif item=='?':
        print ("m | https://webmail.edu.hmu.gr/?_task=mail^&_mbox=INBOX\ne | https://eclass.hmu.gr/modules/auth/cas.php\ns | https://students.hmu.gr/\nE | https://service.eudoxus.gr/student/api/studentDetails\np | https://ece.hmu.gr/proptyxiakes/wrologio-programma-mathhmatwn/\nP | https://ece.hmu.gr/proptyxiakes/programma-spoydwn/\nH | https://ece.hmu.gr\nS | https://secretariat.hmu.gr/auth/login.html\nM | https://www.hmu.gr/merimna/\nC | https://idp.hmu.gr/cas/login\nl | https://lib.hmu.gr/en/home/\nb | https://service.eudoxus.gr/public/departments#48\nk | https://repository.kallipos.gr/\nh | https://www.heal-link.gr/\ni | https://www.hmu.gr/el/hmu/9957\n? | help\nn | http://opencourses-stream.hmu.gr/liveapp/live_viewer-old.php?cid=n")
        os._exit(0)

    if item in i:
        command=f"{command} -new-tab -url http://opencourses-stream.hmu.gr/liveapp/live_viewer-old.php?cid={item}"

if not command:
    print("No valid input was entered")
    os._exit(0)

if os.name=='nt': # Windows
    os.system(f"firefox {command}")
elif os.name=='posix': # Mac | GNU/Linux | BSD
    os.system(f"echo '{command}' | xargs flatpak run org.mozilla.firefox &")
    #print(f"echo {command} | xargs flatpak run org.mozilla.firefox &")
