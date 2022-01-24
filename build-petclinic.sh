#!/bin/sh


#JAVA
export JAVA_HOME=/opt/zulu11.52.13-ca-jdk11.0.13-linux_musl_x64/

#Maven
export M2_HOME=/opt/apache-maven-3.8.3
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

#TOMCAT
export TOMCAT_HOME=/opt/apache-tomcat-9.0.55
export CATALINA_HOME=/opt/apache-tomcat-9.0.55

#System PATH
export PATH=$JAVA_HOME/bin:$M2:$PATH

#PETCLINIC HOME
export PETCLINIC_HOME=/opt/petclinic/

cd $PETCLINIC_HOME


#Build petclinic with defult profile and run unit tests
#mvn clean install -DskipTests

#Build petclinic with defult profile and skip unit tests
mvn clean install -P MySQL -DskipTests



#Deploy petclinic in Tomcat server
cp $PETCLINIC_HOME/target/petclinic.war $TOMCAT_HOME/webapps/ROOT.war
