# vagrant-timescaledb
This is a Vagrant configuration for TimescaleDB.

## Quick Start
```bash
git clone https://github.com/Spinnernicholas/vagrant-timescaledb.git
cd vagrant-timescaledb
vagrant up
```

## Files
* Vagrantfile - Vagrant configuration file
* provision.sh - Script for provisioning TimescaleDB

## Connecting To PostgreSQL Remotely
1. Uncomment Optional Networking Configuration in Vagrantfile before Running "Vagrant Up"
2. Connect with your Prefered Method
  * Host Name/Address: 192.168.100.1
  * Username: postgres
  * Password: password

## Links
* [Vagrant](https://www.vagrantup.com/)
* [Vagrant Box "ubuntu/xenial64"](https://app.vagrantup.com/ubuntu/boxes/xenial64)
* [TimescaleDB](http://www.timescale.com/)
* [TimescaleDB Installation](http://docs.timescale.com/getting-started/installation?OS=linux&method=apt)