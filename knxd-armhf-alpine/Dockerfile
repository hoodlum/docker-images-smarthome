#FROM hypriot/rpi-alpine-scratch
FROM armhf/alpine

RUN 	apk update && \
	apk upgrade && \
	apk add --no-cache bash && \
	apk add --virtual build-dependencies --no-cache \
		build-base gcc abuild binutils binutils-doc \
		gcc-doc git libev-dev automake autoconf libtool \
		argp-standalone linux-headers libusb-dev cmake cmake-doc dev86 && \
	git clone https://github.com/knxd/knxd.git && \
	cd knxd && \
	./bootstrap.sh && \
	./configure --disable-systemd --enable-eibnetip --enable-eibnetserver --enable-eibnetiptunnel && \
	mkdir -p src/include/sys && ln -s /usr/lib/bcc/include/sys/cdefs.h src/include/sys && \
	make && make install && \
	cd .. && rm -rf knxd && \
	apk del build-dependencies && \
	apk add libusb libstdc++ libev

RUN	mkdir -p /opt/knxd

COPY 	entrypoint2.sh make_knxd_config_default.sh /
RUN 	chmod +x /entrypoint2.sh /make_knxd_config_default.sh

VOLUME ["/opt/knxd"]
WORKDIR ["/opt/knxd"]

EXPOSE  4720 6720 3671/udp

ENTRYPOINT ["/entrypoint2.sh"]
CMD ["-t 1023 -e 15.15.1 -i -E 15.15.2:8 -TRS -b ipt:192.168.178.230"]

#ENV EIBADDR 1.1.128
#ENV LISTEN_TCP 6720
#ENV IPTN 10.0.1.6
#EXPOSE ${LISTEN_TCP}
#EXPOSE  4720 6720 3671/udp
#USER knxd
#CMD knxd --eibaddr=${EIBADDR} -u /tmp/eib -D -T -R -S --listen-tcp=${LISTEN_TCP} iptn:${IPTN}
