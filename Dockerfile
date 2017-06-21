#### docker build set ####

# set base image
FROM centos:centos6.6

# make image user
MAINTAINER o-uchi

# all packege update
RUN yum update -y

# install Apache http server
RUN yum install -y httpd && yum install -y tomcat6 tomcat6-webapps tomcat6-admin-webapps

# hostname
ENV HOSTNAME A-P_test 

# Time_zone
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime 

# html
COPY html /var/www/html

# httpd.conf
COPY apache/httpd.conf /etc/httpd/conf/httpd.conf


# container port set
EXPOSE 8080

# apache tomcat start.sh
RUN echo -e "service httpd start\nservice tomcat6 start\n/bin/bash" > /startService.sh

#httpd,tomcat6 start.sh chmod
RUN chmod o+x /startService.shi

### docker run set ###

# start http
CMD /startService.sh
