FROM node:6

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org build-essential wget git python libkrb5-dev vim
ADD https://raw.githubusercontent.com/mongodb/mongo/v3.2/debian/init.d /etc/init.d/mongod
RUN chmod +x /etc/init.d/mongod
WORKDIR /root

COPY package.json /root/package.json
COPY config /root/config
COPY bin /root/bin

EXPOSE 3000
