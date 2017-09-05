# aimpanel-nginx

Project that builds nginx package for use with Aimpanel

## How to start

- you must use Linux (for now)
- install Virtualbox from https://www.virtualbox.org/wiki/Downloads
- install Vagrant from https://www.vagrantup.com/downloads.html
- clone this repo by `git clone https://github.com/aimpanel/nginx aimpanel-nginx`
- enter cloned repo by `cd aimpanel-nginx`
- run `./build.sh` to create temporary virtualmachine which will compile nginx and prepare files needed for package
- run `./build_pkg.sh` to create ready to install .deb package for Debian Wheezy and Ubuntu 14.04

## Acknowledgments

This project is using modified Debian scripts and other means to create system package

## Licensing

This project is licensed under the Apache License, Version 2.0.

You can find full license text in file `LICENSE` located in repository