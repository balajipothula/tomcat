#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 09 May 2019,
# Description : Installing openjdk, tomcat, jenkins on Ubuntu.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing openjdk8.
apt install -y openjdk-8-jre

# starting tomcat server.
sh $HOME/tomcat/bin/startup.sh
