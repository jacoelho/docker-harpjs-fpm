#!/bin/bash

set -e 

export DEBIAN_FRONTEND=noninteractive

printf 'APT::Get::Assume-Yes "true";\nAPT::Install-Recommends "false";\n' > /etc/apt/apt.conf.d/99-defaults
#printf 'install: --no-document\nupdate: --no-document\n' > /etc/gemrc
printf 'gem: --no-rdoc --no-ri' > /etc/gemrc

apt-get update
apt-get upgrade
apt-get install ca-certificates curl build-essential git mercurial apt-transport-https

curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - 

# nodejs repository
echo 'deb https://deb.nodesource.com/node wheezy main' > /etc/apt/sources.list.d/nodesource.list
echo 'deb-src https://deb.nodesource.com/node wheezy main' >> /etc/apt/sources.list.d/nodesource.list

apt-get update
apt-get install nodejs
apt-get install ruby ruby-dev bundler
gem install fpm
gem install fpm-cookery
npm install harp -g
npm install bower -g

apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/*
