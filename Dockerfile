FROM node:carbon

ADD files/ipfs.tgz /opt
RUN ls /opt

ENV PATH="./node_modules/.bin:/opt/go-ipfs:${PATH}"

WORKDIR /opt/project
#RUN npm install typescript
RUN yarn add typescript
#RUN npm install ssb-server
RUN yarn add ssb-server

ADD files/project/ /opt/project
ADD tmp/collabthings-api/ /opt/collabthings-api

RUN cd /opt/collabthings-api && yarn
#npm install
RUN npm install /opt/collabthings-api
#RUN npm install
RUN yarn
RUN tsc

ADD files/run-ipfs.sh /opt/run-ipfs.sh
ADD files/run.sh /opt/run.sh

ENTRYPOINT bash /opt/run.sh
