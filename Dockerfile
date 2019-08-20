FROM alpine:latest

RUN apk add --no-cache bash gettext
RUN \
  apk add --update openssh-client && \
  echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]