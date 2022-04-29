FROM ubuntu:18.04
RUN apt update && apt install -y apache2 && useradd -ms /bin/bash hillel_devops
COPY ports.conf /etc/apache2/ports.conf
EXPOSE 8080
COPY index.html /var/www/html/index.html
ENV APACHE_RUN_USER www-data && APACHE_RUN_GROUP www-data && APACHE_LOG_DIR /var/log/apache2 && APACHE_RUN_DIR /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]