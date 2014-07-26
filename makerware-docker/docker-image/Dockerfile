FROM fedora:20

MAINTAINER O. Schacher <oli@fuglu.org>

RUN yum localinstall -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN yum localinstall -y --nogpgcheck http://downloads.makerbot.com/makerware/yum/makerware-repo-1.0-1.fc19.noarch.rpm 
RUN yum install -y redhat-lsb 
RUN yum install -y makerware

RUN touch /.makerware-license-accepted 
CMD sh /usr/bin/makerware
