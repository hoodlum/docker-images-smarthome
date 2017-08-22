#
# Dockerfile for telegraf-arm
#

FROM resin/raspberrypi3-alpine-buildpack-deps:curl as builder

ENV TELEGRAF_VERSION 1.3.5
ENV TELEGRAF_FILE telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz
ENV TELEGRAF_URL https://dl.influxdata.com/telegraf/releases/${TELEGRAF_FILE}

RUN curl -sSL ${TELEGRAF_URL} | tar xz --strip 2 -C /

#FROM hypriot/rpi-alpine
#alternativ: FROM resin/raspberrypi3-alpine

#COPY --from=builder /telefraf

#EXPOSE 8092/udp 8094/tcp 8125/udp

#ENTRYPOINT ["telegraf"]
