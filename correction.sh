#!/bin/bash

if [[ $1 = "network" ]]
then
	clear
	for i in {1..5}
	do
		echo -e "\033[32m\033[1mExo 0$i :\033[0m\n"
		cat network/0$i && sh network/0$i
		printf "%.0s-" {1..80}; echo
		read -n 1 -s
		clear
	done

	echo -e "\033[32m\033[1mExo 06 :\033[0m\n"
	cat network/06
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 07 :\033[0m\n"
	cat network/07 && sh network/07
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 08 :\033[0m\n"
	cat network/08
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 09 :\033[0m\n"
	cat network/09
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 10 :\033[0m\n"
	cat network/10
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 11 :\033[0m\n"
	cat network/11
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 12 :\033[0m\n"
	cat network/12
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 13 :\033[0m\n"
	cat network/13
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 14 :\033[0m\n"
	cat network/14
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 15 :\033[0m\n"
	cat network/15
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 16 :\033[0m\n"
	cat network/16
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear
	exit 0

elif [[ $1 = "system" ]]
then
	clear
	echo -e "\033[32m\033[1mExo 01 :\033[0m\n"
	cat system/01
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 02 :\033[0m\n"
	cat system/02
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 03 :\033[0m\n"
	cat system/03
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	for i in {4..7}
	do
		echo -e "\033[32m\033[1mExo 0$i :\033[0m\n"
		cat system/0$i && sh system/0$i
		printf "%.0s-" {1..80}; echo
		read -n 1 -s
		clear
	done

	echo -e "\033[32m\033[1mExo 08 :\033[0m\n"
	cat system/08
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	for i in {10..15}
	do
		echo -e "\033[32m\033[1mExo $i :\033[0m\n"
		cat system/$i && sh system/$i
		printf "%.0s-" {1..80}; echo
		read -n 1 -s
		clear
	done

	echo -e "\033[32m\033[1mExo 16 :\033[0m\n"
	cat system/16
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mExo 17 :\033[0m\n"
	cat system/17 && sh system/17
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	for i in {18..19}
	do
		echo -e "\033[32m\033[1mExo $i :\033[0m\n"
		cat system/$i && sh system/$i
		printf "%.0s-" {1..80}; echo
		sudo iptables -L -n -v --line-numbers
		printf "%.0s-" {1..80}; echo
		read -n 1 -s
		clear
	done
	exit 0
elif [[ $1 = "scripting" ]]
then
	clear

	echo -e "\033[32m\033[1mScript 1 :\033[0m\n"
	cat scripts/passwd.pl
	read -n 1 -s
	clear
	./scripts/passwd.pl
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo "Disabling iptable rules in order to update"
	sudo iptables -D INPUT 2
	wait 1000
	echo -e "\033[32m\033[1mScript 2 :\033[0m\n"
	cat scripts/update.sh
	read -n 1 -s
	./scripts/update.sh
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	(crontab -l ; echo "0 4 * * 1 $HOME/.script/update.sh") | crontab -
	clear

	echo -e "\033[32m\033[1mScript 3 :\033[0m\n"
	cat scripts/sort.sh
	read -n 1 -s
	./scripts/sort.sh /
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mScript 4 :\033[0m\n"
	echo "Making some change in /etc/crontab"
	scripts/crontab_watch.sh create
	sudo echo "0 22 * * * mplayer Rick_and_Morty" | sudo tee -a /etc/crontab
	wait 1000
	clear
	cat scripts/crontab_watch.sh
	read -n 1 -s
	./scripts/crontab_watch.sh
	printf "%.0s-" {1..80}; echo
	read -n 1 -s
	clear

	echo -e "\033[32m\033[1mScript 5 :\033[0m\n"
	cat scripts/42.sh
	read -n 1 -s
	./scripts/42.sh
	printf "%.0s-" {1..80}; echo
	clear
	exit 0
else
	echo -e "Usage: correction.sh [network system scripting]"
fi
