#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing tomcat Docker image on Ubuntu.

# Note: Please run this script with sudo privilage.

# setting maven version.
readonly TOMCAT_VER=8.5.40

# uninstalling old versions of docker.
apt -y remove docker docker-engine docker.io

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing packages to allow apt to use repository over https.
apt -y install apt-transport-https \
               ca-certificates     \
               curl                \
               software-properties-common

# adding docker official gpg key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# setting up the stable docker repository.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# updating apt package index.
apt update

# installing latest version of docker ce.
apt -y install docker-ce docker-ce-cli containerd.io

# downloading and setting tomcat server.
cd $HOME                                                                                                          \
  && wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v$TOMCAT_VER/bin/apache-tomcat-$TOMCAT_VER.tar.gz \
  && tar xzf apache-tomcat-$TOMCAT_VER.tar.gz                                                                     \
  && mv apache-tomcat-$TOMCAT_VER $HOME/tomcat                                                                    \
  && rm apache-tomcat-$TOMCAT_VER.tar.gz


 
  
