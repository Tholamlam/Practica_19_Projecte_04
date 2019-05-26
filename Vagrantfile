Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Configuration for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
  vb.gui = true
  
  # Customize the amount of memory on the VM:
  vb.memory = "2048"
  end
 
# Begin Configuring
config.vm.define "vagrant" do|lamp|
vagrant.vm.hostname = "vagrant" # Setting up hostname
end

