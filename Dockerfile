FROM varnish:stable
RUN apt update
RUN apt-get install -y varnish
RUN apt-get -y install wget automake nano make libtool python3-docutils libvarnishapi-dev pkg-config libpcre3-dev libreadline-dev
RUN rm -f DataDome-Varnish-latest.tgz &&\
    wget https://package.datadome.co/linux/DataDome-Varnish-latest.tgz &&\
    tar -zxvf DataDome-Varnish-latest.tgz &&\
    cd DataDome-VarnishDome-* &&\
    ./autogen.sh &&\
    ./configure &&\
    make &&\
    make install 

COPY ./datadome.vcl /etc/varnish/
COPY ./default.vcl /etc/varnish

EXPOSE 6080