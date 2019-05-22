#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 09 May 2019,
# Description : Installing openjdk, tomcat, jenkins on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing openjdk8.
apt install -y openjdk-8-jre

# downloading jenkins.war
wget https://updates.jenkins-ci.org/latest/jenkins.war -O $HOME/tomcat/webapps/ROOT.war

# starting tomcat server.
sh $HOME/tomcat/bin/startup.sh

# jenkins unlock initial admin password.
##sudo cat /root/.jenkins/secrets/initialAdminPassword
