FROM ubuntu 

## Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

## Install services, packages and do cleanup
RUN apt update 
RUN apt install -y  apache2 
RUN apt install -y apache2-utils 
RUN apt clean 

## Copy files
COPY ./website/  /var/www/html/

## Expose Apache
EXPOSE 80

## Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]