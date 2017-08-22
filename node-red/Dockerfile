# run from offical node-red (pi-version, based on hypriot/node:6)
FROM nodered/node-red-docker:rpi

#BaseImage-Infos:
#WORKDIR /usr/src/node-red
#USER node-red

USER node-red

WORKDIR /usr/src/node-red

#Install additianl plugins (called nodes)
run npm install node-red-contrib-luxtronik2 \
                node-red-contrib-azureiothubnode \
                node-red-contrib-knxjs \
                node-red-contrib-influxdb

#EXPOSE 1880

#ENV FLOWS=flows.json

#CMD ["npm", "start", "--", "--userDir", "/data"]
