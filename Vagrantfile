Vagrant.configure("2") do |config|
	#Configuramos que imagen usaremos.
	config.vm.box = "ubuntu/xenial64"
	#Asignamos el hostname.
	config.vm.box = "vagrant"

	# Configuracion para VirtualBox:
	config.vm.provider "virtualbox" do |vb|
	# Cantidad de ram asignada.
	vb.memory = "2048"
	end
	
	#Configuramos la maquina una vez instalada para que tenga los scripts que hemos creados y las herramientas necesarias para su ejecucion.
	config.vm.provision "file", source: "show-attackers.sh", destination: "show-attackers.sh" 
	config.vm.provision "file", source: "syslog-sample", destination: "syslog-sample"
	config.vm.provision "shell", inline: "apt install geoip-bin geoip-database -y; chmod +x show-attackers.sh"

end
