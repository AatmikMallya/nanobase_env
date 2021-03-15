# nanobase_env
Sets up a developer environment for [Nanobase](https://github.com/sulcgroup/nanobase). This project uses [Vagrant](https://www.vagrantup.com/) to provision the environment into a containerized VirtualBox. 

## Setup
In order to get setup, follow these steps:

1. Installl [Vagrant](https://www.vagrantup.com/downloads)
	> Vagrant is a "wrapper" around virtualization providers like VirtualBox to make provisioning VMs easier. We will be using Vagrant and Virtualbox to create a sandboxed ubuntu machine to host the Nanobase application. 
  
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
	> Virtualbox will be used to actually containerize the application. Please ensure that the hardware you will using supports virtualization. On Intel, this is typically VT-d or VT-x, on, AMD, this is AMD-V. [You may need to enable this in your BIOS.](https://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/sect-Virtualization-Troubleshooting-Enabling_Intel_VT_and_AMD_V_virtualization_hardware_extensions_in_BIOS.html)

3. Go to the directory you would like to keep the project in, and clone the repository.  
	> ```git clone https://github.com/AatmikMallya/nanobase_env.git ```

4. Go to the newly-cloned azDNA_env directory, and use vagrant to start up the machine. Vagrant will parse the "Vagrantfile" in the directory and use that to provision the machine.
	> ```cd nanobase_env; vagrant up```

5. Give the machine a few minutes to finish provisioning. It needs to download an extensive set of libraries and frameworks. Once it's done, you will see a message in your terminal to indicate that server has launched.
	> azDNA: Server now ready at :8000!

6. You can now visit http://localhost:8000 and use the server as desired.
