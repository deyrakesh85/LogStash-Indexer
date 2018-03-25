FROM deyrakesh85/ubuntu:jdk8

MAINTAINER Rakesh Dey <deyrakesh85@gmail.com>

RUN groupadd -r logstash && useradd -r -g logstash -s /bin/bash -s /home/logstash logstash

RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-6.2.2.tar.gz

RUN tar -xzf logstash-6.2.2.tar.gz

COPY logstash.conf /data/configuration/logstash.conf

RUN chown -R logstash:logstash /data

USER logstash

WORKDIR /data

RUN chmod -R 755 *

EXPOSE 5044

WORKDIR /data/logstash-6.2.2/bin

CMD ["./logstash", "-f /data/configuration/"]