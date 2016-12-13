#!/bin/bash
echo "Host IP-Address is $1"
echo "Set LDAP Server to $1:$2"

rm -rf *.rb*

sed -e s/localhost/$1/g templete_gitlab > gitlab.rb
sed -i -e s/ldap_port/$2/g gitlab.rb
sudo cp /vagrant_data/gitlab.rb /etc/gitlab/gitlab.rb

sudo gitlab-ctl reconfigure
sudo gitlab-rake gitlab:ldap:check


