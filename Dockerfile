FROM ubuntu:latest
WORKDIR /root/gitmind
RUN apt update && \
    apt install -y git && \
    apt install -y nano && \
    apt install -y cron

COPY .bashrc /root/
COPY .gitconfig /root/

#copia o crontab da pasta do host para cron.d/
COPY crontab /etc/cron.d/gitmind

# seta rotina do crontab
ENTRYPOINT /etc/init.d/cron start && \
    crontab /etc/cron.d/gitmind && \
    /bin/bash

