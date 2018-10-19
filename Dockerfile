FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
	libxml2-dev \
	intltool \
	itstool \
	libxml2-utils \
	libgtk-3-dev \
	librsvg2-dev \
	libqrencode-dev

RUN curl http://ftp.gnome.org/pub/GNOME/sources/glabels/3.4/glabels-3.4.1.tar.xz \ 
	-o glabels.xv && \
	tar xvf glabels.xv

WORKDIR /glabels-3.4.1/

RUN ./configure && \
	make && \
	make install && \
	ldconfig

RUN useradd -m glabels

USER glabels

WORKDIR /home/glabels

ENTRYPOINT glabels-3
