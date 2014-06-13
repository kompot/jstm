FROM ubuntu:14.04
#MAINTAINER David Weinstein <david@bitjudo.com>
 
# install our dependencies and nodejs
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install software-properties-common git build-essential
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

VOLUME /vagrant
 
# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
#RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/
RUN cp -a /tmp/node_modules /opt/app/

# From here we load our application's code in, therefore the previous docker
# "layer" thats been cached will be used if possible
WORKDIR /vagrant
#ADD . /opt/app
 
EXPOSE 3000
 
CMD ["node", "index.js"]
