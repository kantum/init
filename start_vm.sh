#/bin/sh
export VAGRANT_HOME=/Volumes/Storage/goinfre/$USER
vboxmanage setproperty machinefolder $VAGRANT_HOME
cd $VAGRANT_HOME
vagrant box add https://app.vagrantup.com/debian/boxes/stretch64 --provider virtualbox
rm $VAGRANT_HOME/Vagrantfile
echo 'Vagrant.configure("2") do |config|
	config.vm.box = "debian/stretch64"
  config.vm.provider "virtualbox" do |vb|
	  vb.gui = true
	  vb.memory = "1024"
  end
end' > $VAGRANT_HOME/Vagrantfile
mkdir debian_vm
cd debian_vm
vagrant init debian/stretch64
vagrant up
echo "Login\t\t= valgrant\nPassword\t= valgrant\n"
