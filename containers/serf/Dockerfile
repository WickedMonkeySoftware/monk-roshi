FROM ubuntu:14.04
MAINTAINER withinboredom

RUN apt-get install -y unzip curl && curl -Lso /tmp/serf.zip https://dl.bintray.com/mitchellh/serf/0.6.4_linux_amd64.zip && mkdir -p /usr/local/serf/bin && unzip /tmp/serf.zip -d /usr/local/serf/bin && ln -s /usr/local/serf/bin /usr/local/bin/serf && rm /tmp/serf.zip
ENV SERF_HOME /usr/local/serf

EXPOSE 7373 7946
CMD /usr/local/bin/serf agent -node roshi