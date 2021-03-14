FROM node:lts

RUN apt-get update
RUN apt-get install -q -y ssmtp mailutils
RUN echo "mailhub=smtpdm.aliyun.com:465" >> /etc/ssmtp/ssmtp.conf
RUN echo "root=noreply@mail.nodebb-cn.org" >> /etc/ssmtp/ssmtp.conf
RUN echo "UseTLS=YES" >> /etc/ssmtp/ssmtp.conf
RUN echo "UseSTARTTLS=YES" >> /etc/ssmtp/ssmtp.conf

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY . /usr/src/app

ENV NODE_ENV=production \
    daemon=false \
    silent=false

EXPOSE 4567

CMD node ./nodebb start
