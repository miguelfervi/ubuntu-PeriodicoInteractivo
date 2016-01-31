# ubuntu-periodicointeractivo
FROM ubuntu
MAINTAINER Miguel Fernández Villegas <miguelfervi@gmail.comm>  Version: 1.3

# Instalaremos los paquetes y herramientas necesarias para el despliegue de la aplicación
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
RUN apt-get update
RUN apt-get -y install python python-setuptools python-dev mongodb-10gen python-django gcc build-essential git
RUN easy_install web.py
RUN easy_install mako
RUN easy_install pymongo
RUN easy_install feedparser
#RUN easy_install tweepy
RUN  git clone git://github.com/joshthecoder/tweepy.git
RUN  cd tweepy && python setup.py install

# Descargamos y lanzamos la aplicación
RUN git clone https://github.com/miguelfervi/ProjectCC.git /home/PeriodicoInteractivo
RUN cd /home/PeriodicoInteractivo && python script.py
