FROM node:carbon

ADD files/ipfs.tgz /opt
RUN ls /opt

ENV PATH="./node_modules/.bin:/opt/go-ipfs:${PATH}"

ADD files/project/ /opt/project
ADD tmp/collabthings-api/ /opt/collabthings-api
WORKDIR /opt/project

RUN cd /opt/collabthings-api && npm install
RUN pwd && ls
RUN npm install /opt/collabthings-api
RUN npm install typescript
RUN npm install ssb-server
RUN npm install
RUN tsc
RUN ls ./node_modules/.bin/

ADD files/run-ipfs.sh /opt/run-ipfs.sh
ADD files/run.sh /opt/run.sh

ENTRYPOINT bash /opt/run.sh





