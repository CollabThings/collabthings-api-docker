FROM node:carbon

ADD files/ipfs.tgz /opt
RUN ls /opt

ENV PATH="./node_modules/.bin:/opt/go-ipfs:${PATH}"

RUN npm install -g pnpm

ADD tmp/collabthings-api/ /opt/collabthings-api

ADD files/project/ /opt/project
WORKDIR /opt/project
RUN ls 
RUN pnpm install

RUN cd /opt/collabthings-api && pnpm install

RUN pnpm install /opt/collabthings-api
RUN pnpm install
RUN tsc

ADD files/run-ipfs.sh /opt/run-ipfs.sh
ADD files/run.sh /opt/run.sh

ENTRYPOINT bash /opt/run.sh
