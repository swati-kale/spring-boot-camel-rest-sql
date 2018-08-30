#!/bin/bash 

oc new-app --template=mysql-persistent --param=MYSQL_USER=admin --param=MYSQL_PASSWORD=password
mvn fabric8:deploy -Dfabric8.generator.from=$(oc project -q)/jboss-fuse70-java-openshift:1.0 -Dmysql-service-username=admin  -Dmysql-service-password=password 
oc get services spring-boot-camel-rest-s -o yaml