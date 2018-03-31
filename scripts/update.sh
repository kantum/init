#!/bin/sh

sudo apt-get update 2>&1 | sudo tee -a /var/log/update_script.log
sudo apt-get upgrade -y 2>&1 | sudo tee -a /var/log/update_script.log

#In order to start this script every monday at 4:00 launch this command :
# (crontab -l ; echo "0 4 * * 1 $HOME/.script/update.sh") | crontab -
