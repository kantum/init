#/bin/sh
# In order to work this script needs vagrant and virtualbox to be installed

# Make rules
if [[ $1 = "clean" ]]
then
	rm -rf /Volumes/Storage/goinfre/$USER/debian_vm
	exit 0
elif [[ $1 = "provision" ]]
then
	cd /Volumes/Storage/goinfre/$USER/debian_vm
	vagrant provision
	exit 0
elif [[ $1 = "stop" ]]
then
	cd /Volumes/Storage/goinfre/$USER/debian_vm
	vagrant halt
	exit 0
elif [[ $1 = "start" ]]
then
	# Set the directory path
	export BASE_DIR=`pwd`

	# Create the output folder
	mkdir -p /Volumes/Storage/goinfre/$USER/debian_vm

	# Make vagrant download in goinfre
	export VAGRANT_HOME=/Volumes/Storage/goinfre/$USER/debian_vm

	# Make virtualbox to use the same directory
	vboxmanage setproperty machinefolder $VAGRANT_HOME
	cd $VAGRANT_HOME

	# Add the debian "box" (download the iso)
	if [[ ! -d boxes ]]
	then
		vagrant box add https://app.vagrantup.com/debian/boxes/stretch64 \
			--provider virtualbox
	fi
	if [[ ! -f Vagrantfile ]]
	then
		vagrant init debian/stretch64
	fi

	# Remove the automatique Vagrantfile and make our own
	rm $VAGRANT_HOME/Vagrantfile
	echo "Vagrant.configure(\"2\") do |config|
		config.vm.box = \"debian/stretch64\"
	config.vm.provider \"virtualbox\" do |vb|
		#vb.gui = true
	vb.memory = \"1024\"
	config.vm.provision \"shell\", inline: <<-SHELL
	apt-get update
	apt-get install -y vim sendmail mailutils
	SHELL
	config.vm.synced_folder \".\", \"/vagrant\", :disabled => true
	config.vm.provision \"file\", source: \"$BASE_DIR/system\",
	destination: \"/home/vagrant/system\"
	config.vm.provision \"file\", source: \"$BASE_DIR/scripts\",
	destination: \"/home/vagrant/scripts\"
	config.vm.provision \"file\", source: \"$BASE_DIR/correction.sh\",
	destination: \"/home/vagrant/correction.sh\"
	end
	end" > $VAGRANT_HOME/Vagrantfile
	vagrant up
	vagrant ssh
else
	echo "Usage: vm.sh [start stop provision clean]"
fi
