FROM ubuntu
MAINTAINER aayupov

## install cifs-utils
RUN apt-get update \
    && apt-get install -y cifs-utils


RUN mkdir /mnt/smb \
    && rm -rf /tmp/* /var/cache/apk/* /var/lib/apk/lists/*

ADD start.sh /start.sh

RUN chmod 777 /start.sh

VOLUME /mnt

CMD ["/start.sh"]
