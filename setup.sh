#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing tomcat Docker image on Ubuntu.

# Note: Please run this script with sudo privilage.

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

# extracting tomcat tar ball and removing.
tar xzf $HOME/jenkins/tomcat.tar.gz -C $HOME/jenkins && rm $HOME/jenkins/tomcat.tar.gz

# downloading jenkins.war
wget https://updates.jenkins-ci.org/latest/jenkins.war -O $HOME/jenkins/tomcat/webapps/ROOT.war

# pulling jenkins image from docker hub.
docker pull balajipothula/jenkins:latest

# running docker container with name(--name) "jenkins" as daemon(-d),
# stdin(-i) with volume(-v) "tomcat" on port(-p) "8080".
docker run --name jenkins -d -i -p 8080:8080 --privileged -v $HOME/jenkins/tomcat:/tomcat balajipothula/jenkins:latest sh

# executing docker container by name with stdin(-i), starting tomcat server.
docker exec -i jenkins /tomcat/bin/startup.sh
