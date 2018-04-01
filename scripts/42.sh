#!/bin/bash

DATA[0]="                           :oNMMMMMMMMMMMMd/      +MMMMMMMMMMMMm/hMMMMMMMMMMMMMM "
DATA[1]="                         :oNMMMMMMMMMMMMd/        +MMMMMMMMMMm/  hMMMMMMMMMMMMMM "
DATA[2]="                       :oNMMMMMMMMMMMMd/          +MMMMMMMMm/    hMMMMMMMMMMMMMM "
DATA[3]="                     :oNMMMMMMMMMMMMd/            +MMMMMMm/      hMMMMMMMMMMMMMM "
DATA[4]="                   :oNMMMMMMMMMMMMd/              +MMMMm/        hMMMMMMMMMMMMMM "
DATA[5]="                 :oNMMMMMMMMMMMMd/                +MMm/          hMMMMMMMMMMMMMM "
DATA[6]="               :oNMMMMMMMMMMMMd/                  +m/            hMMMMMMMMMMMMMM "
DATA[7]="             :oNMMMMMMMMMMMMd/                    .             :mMMMMMMMMMMMMNs "
DATA[8]="           :oNMMMMMMMMMMMMd/                                  :dMMMMMMMMMMMMNs.  "
DATA[9]="         :oNMMMMMMMMMMMMd/                                  :dMMMMMMMMMMMMNs.    "
DATA[10]="       :oNMMMMMMMMMMMMd/                                  :dMMMMMMMMMMMMNs.     "
DATA[11]="     :oNMMMMMMMMMMMMd/                                  :dMMMMMMMMMMMMNs.       "
DATA[12]="   :sNMMMMMMMMMMMMd/                                  :dMMMMMMMMMMMMNs.         "
DATA[13]=" :sNMMMMMMMMMMMMd:                                  :dMMMMMMMMMMMMNs.           "
DATA[14]="sNMMMMMMMMMMMMNy:::::::::::::::::::::::::::::     -dMMMMMMMMMMMMMy.            :"
DATA[15]="MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM:           :sN"
DATA[16]="MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM:         :sNMM"
DATA[17]="MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM:       :sNMMMM"
DATA[18]="MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM:     :sNMMMMMM"
DATA[19]="MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM:   :sNMMMMMMMM"
DATA[20]="yyyyyyyyyyyyyyyyyyyyyyyyyyyyydMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM: :sNMMMMMMMMMM"
DATA[21]="                             oMMMMMMMMMMMMMM-     +MMMMMMMMMMMMMM/sNMMMMMMMMMMMM"
DATA[22]="                             oMMMMMMMMMMMMMM-      :::::::::::::::::::::::::::::"
DATA[23]="                             oMMMMMMMMMMMMMM-                                   "
DATA[24]="                             oMMMMMMMMMMMMMM-                                   "
DATA[25]="                             oMMMMMMMMMMMMMM-                                   "
DATA[26]="                             oMMMMMMMMMMMMMM-                                   "
DATA[27]="                             oMMMMMMMMMMMMMM-                                   "

clear
REAL_OFFSET_X=0
REAL_OFFSET_Y=0

draw_char()
{
	V_COORD_X=$1
	V_COORD_Y=$2

	tput cup $((REAL_OFFSET_Y + V_COORD_Y)) $((REAL_OFFSET_X + V_COORD_X))

	printf %c ${DATA[V_COORD_Y]:V_COORD_X:1}
}


trap 'exit 1' INT TERM
trap 'tput setaf 9; tput cvvis; clear' EXIT

tput civis

while :
do
	for ((c=1; c <= 7; c++))
	do
		tput setaf $c
		for ((x=0; x<80; x++))
		#for ((y=0; y<27; y++))
		do
			for ((y=0; y<=28; y++))
			#for ((x=0; x<=80; x++))
			do
				draw_char $x $y
			done
		done
	done

done
