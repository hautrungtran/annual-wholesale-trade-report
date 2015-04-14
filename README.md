# Introduction
This application allows you can import and display data that are downloaded from
[https://catalog.data.gov/dataset/monthly-wholesale-trade](https://catalog.data.gov/dataset/monthly-wholesale-trade)
# Installation
Only tested on Ubuntu.
## Prerequisite
1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://www.vagrantup.com/downloads.html)

## Install Vagrant plugins:
```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-librarian-chef-nochef
```
## Clone or download this repo
```
git clone https://github.com/shine60vn/shipstr-test.git
```
or
```
wget https://github.com/shine60vn/shipstr-test.git
```
## Start Vagrant box
```
vagrant up
```
and wait until the box booted successfully!
## Install require gems
```
bin/bundle install
rbenv rehash
```
## Setup database
```
rake db:create
rake db:migrate
```
## Start web server (Puma)
```
rails server -b 0.0.0.0
```
# Import sample data
You can import all sample data with one command
```
rake import:sample_data
```
## You've done and now you can browse [http://localhost:3000](http://localhost:3000).
