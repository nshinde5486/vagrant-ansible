# vagrant environment setup for ansible


This setup provides a vagrant environment which once established, provides an Ansible control machine and a server to run the playbooks on.

Repo inclused following files:

ansible.cfg  
bootstrap-control-ansible.sh  
files/ntp.conf
inventory.ini  
ntp-install.yml  
role-common.yml  
roles/common/tasks/main.yml
Vagrantfile

These files serve following purpose.

- shell script is used to install ansible and copy all the files in "playbooks" folder on the ansible control machine.
- ansible.cfg provides inventoery file location.
- inventory.ini contains all the hosts we want to run the ansible playbooks on.
- role-common.yml and ntp-install.yml are playbooks that will be run on the hosts.
- roles directory contains role called "common" which is common for all hosts(if we add anymore in future)
- files folder contains any cfg files we need to copy on the host in order to run custom config.
- Vagrantfile contains the code to start the control machine and server 
