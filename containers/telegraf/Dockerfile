FROM telegraf:1.22.1

RUN echo "deb http://ftp.us.debian.org/debian stretch main non-free" >> /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping snmp procps snmp-mibs-downloader && \
    rm -rf /var/lib/apt/lists/*

COPY ./FROGFOOT-RESOURCES-MIB /usr/share/snmp/mibs/FROGFOOT-RESOURCES-MIB
COPY ./UBNT-MIB /usr/share/snmp/mibs/UBNT-MIB
COPY ./UBNT-UniFi-MIB /usr/share/snmp/mibs/UBNT-UniFi-MIB
