FROM telegraf:latest

#RUN echo "deb http://ftp.us.debian.org/debian stretch main non-free" >> /etc/apt/sources.list
#RUN echo "deb http://ftp.us./debian stretch main non-free" >> /etc/apt/sources.list


#RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
#    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends smartmontools sudo nvme-cli ipmitool iputils-ping snmp procps snmp-mibs-downloader mtr && \
#    rm -rf /var/lib/apt/lists/*

#RUN echo telegraf ALL=NOPASSWD:/usr/sbin/smartctl >> /etc/sudoers
#RUN echo telegraf ALL=NOPASSWD:/usr/sbin/nvme >> /etc/sudoers 

RUN rm /etc/telegraf/telegraf.conf*
RUN touch /etc/telegraf/telegraf.conf
