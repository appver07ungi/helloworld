#### docker build set ####

# set base image
FROM centos:centos6.6

# make image user
MAINTAINER o-uchi

# all packege update & install http tomcat java 
RUN yum update -y && yum install -y httpd && yum install -y tomcat6 tomcat6-webapps tomcat6-admin-webapps && yum install -y  java-1.8.0-openjdk-devel

# hostname
ENV HOSTNAME A-P_test 

# java api-jar
RUN echo "export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64" >> /root/.bash_profile

# java env
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64

# Time_zone
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime 

# html
COPY html /var/www/html

# httpd.conf
COPY apache/httpd.conf /etc/httpd/conf/httpd.conf


# container port set
EXPOSE 80

# apache tomcat start.sh
RUN echo -e "service httpd start\nservice tomcat6 start\n/bin/bash" > /startService.sh

#httpd,tomcat6 start.sh chmod
RUN chmod o+x /startService.sh

### docker run set ###

# start http
CMD sh /startService.sh
