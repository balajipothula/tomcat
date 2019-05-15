#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 09 May 2019,
# Description : Installing openjdk, maven, tomcat, jenkins on Ubuntu.

# Note: Please run this script with sudo privilage.

# setting maven version.
readonly MVN_VER=3.6.1

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing openjdk8.
# maven3.3+ require jdk1.7+
apt install -y openjdk-8-jdk

cd $HOME                                                                                                         \
  && wget http://mirrors.estointernet.in/apache/maven/maven-3/$MVN_VER/binaries/apache-maven-$MVN_VER-bin.tar.gz \
  && tar xzf apache-maven-$MVN_VER-bin.tar.gz                                                                    \
  && mv apache-maven-$MVN_VER $HOME/maven                                                                        \
  && ln -s $HOME/maven/bin/mvn /usr/bin/mvn                                                                      \
  && rm apache-maven-$MVN_VER-bin.tar.gz

# extracting tomcat tar ball and removing.
tar xzf $HOME/jenkins/tomcat.tar.gz -C $HOME/jenkins && rm $HOME/jenkins/tomcat.tar.gz

# downloading jenkins.war
wget https://updates.jenkins-ci.org/latest/jenkins.war -O $HOME/jenkins/tomcat/webapps/ROOT.war

# starting tomcat server
sh $HOME/jenkins/tomcat/bin/startup.sh
