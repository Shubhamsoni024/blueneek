### Now we are working the docker component
FROM centos:7

### Owner of the Docker configuration file
MAINTAINER shubham.soni@rglabs.net

### Running the os update and installing the apache package
RUN yum update -y &&  \
    yum install applydeltarpm httpd git wget zip unzip net-tools -y

### Adding the developer website to the Apache DocumentRoot
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/petlover.zip /var/www/html/

## Changing the Working directory
WORKDIR /var/www/html/

## Extracting the content
RUN unzip petlover.zip

### Copying the configuration files to the main documentroot to run
RUN cp -rvf pet-care-website-template/* .

### Removing the zip and empty website folder
RUN rm -rf petlover.zip pet-care-website-template

### Environment variable
ENV myname shubham_webhost

### Starting the apache configuration
CMD /usr/sbin/httpd -D FOREGROUND

### Exposing the containerPort
EXPOSE 80
