# steps to install ansible from git
# adding ansible openswitch core module from privateip

sudo apt-get install git -y
git clone git@github.com:ansible/ansible.git --recursive
cd ansible/lib/ansible/modules/core
git remote add working git@github.com:privateip/ansible-modules-core
git fetch working
git checkout -t working/working -b working
cd ../../../..
sudo make install

# copy playbooks and roles into /home/vagrant (from inside the control node)
cp -a playbooks/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.10.1 control
192.168.10.2 server
EOL
