#FROM avastsoftware/alpine-perl
FROM stelzer77/perl-armhf-alpine

MAINTAINER stelzer77

ENV FHEM_VERSION 5.8
ENV TMP /tmp/fhem

RUN apk add --update  --no-cache \
	    bash \
	    perl-device-serialport \
            perl-io-socket-ssl \
            perl-libwww \
            perl-xml-simple \
            perl-json

RUN mkdir -p /opt/fhem && mkdir -p ${TMP} && \
    addgroup fhem && \
    adduser -D -G fhem -h /opt/fhem -u 1000 fhem

ADD http://fhem.de/fhem-${FHEM_VERSION}.tar.gz ${TMP}/fhem.tar.gz
RUN tar xvzf ${TMP}/fhem.tar.gz -C /usr/local/lib && \
    mv /usr/local/lib/fhem-${FHEM_VERSION} /usr/local/lib/fhem && \
    rm -rf ${TMP}

#EXPOSE 8083 8084 8085 7072
EXPOSE 8083

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh

VOLUME /opt/fhem
WORKDIR /opt/fhem

USER fhem

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
