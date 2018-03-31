#/bin/sh
if [ -f $BASE_DIR ]
then
	echo Set the \"\$BASE_DIR\" variable to send the scripts to the vm
	exit 1
fi

# Create the output folder
mkdir -p /Volumes/Storage/goinfre/$USER/debian_vm

# Make vagrant download in goinfre
export VAGRANT_HOME=/Volumes/Storage/goinfre/$USER/debian_vm

# Make virtualbox to use the same directory
vboxmanage setproperty machinefolder $VAGRANT_HOME
cd $VAGRANT_HOME

# Add the debian "box" (download the iso)
vagrant box add https://app.vagrantup.com/debian/boxes/stretch64 --provider virtualbox
vagrant init debian/stretch64

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
	config.vm.provision \"file\", source: \"$BASE_DIR/scripts\", destination: \"/home/vagrant/.script\"
	end
end" > $VAGRANT_HOME/Vagrantfile
vagrant up
vagrant ssh
