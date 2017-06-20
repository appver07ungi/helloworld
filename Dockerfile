# os centos6
FROM centos:centos6

# Dockerfile Make
MAINTAINER oouchi

# Time_zone set
RUN /bin/cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# httpd/tomcat install
RUN yum -y install httpd tomcat6 tomcat6-webapps tomcat6-admin-webapps tomcat6-docs-webapp

# apache to tomcat
COPY apache/httpd.conf /etc/httpd/conf/httpd.conf

# html
COPY html /var/www/html
