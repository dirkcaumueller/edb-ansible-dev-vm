# edb-ansible Development VM

This repository contains information on how to provision a development vm with Vagrant and Virtualbox for the [EDB Ansible collection](https://github.com/EnterpriseDB/edb-ansible). The provisioning process takes care to install all requirements.

The following apps are installed:

* Docker
  * Docker compose plugin
* make
* Git
* Python 3 - Pip
* Ansible


## Prerequisites

The following software is required for provisioning:

* [VirtualBox](https://www.virtualbox.org/) (latest release)
* [Vagrant](https://www.vagrantup.com/) (latest release)


## Creation

Create the vm and wait until the command finished.

```bash
vagrant up
```


## Run

Ssh into the vm or use VSCode to connect to and follow the [contribution](https://github.com/EnterpriseDB/edb-ansible/blob/master/CONTRIBUTING.md) and [test](https://github.com/EnterpriseDB/edb-ansible/blob/master/tests/README.md) guides.

