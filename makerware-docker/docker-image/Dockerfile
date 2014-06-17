FROM ubuntu:13.10

MAINTAINER O. Schacher <oli@fuglu.org>

RUN apt-get update -qq
RUN apt-get install -y python-software-properties software-properties-common wget
RUN apt-add-repository 'deb http://downloads.makerbot.com/makerware/ubuntu saucy main' 
RUN wget http://downloads.makerbot.com/makerware/ubuntu/dev@makerbot.com.gpg.key -qO - | apt-key add -
RUN apt-get update -qq
RUN apt-get install -y makerware
RUN touch /.makerware-license-accepted 
CMD sh /usr/bin/makerware