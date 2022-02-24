## Purpose
- Deploy a pi-hole and unifi controller on a raspberry pi with Docker. 
- Run both behind an nginx reverse proxy to be able to access them both over https and with dedicated subpaths (although not fully supported).
- Deployment:
    - unifi controller container
    - pi-hole container
    - nginx as reverse proxy container
    - dhcp-helper as dhcp relay container

## Pre-Requisites
- Make sure to setup your raspberry pi.
    - Setup a static ip:
        - Add to the following file `/etc/dhcpcd.conf`:
        ````
        interface eth0
            static ip_address=192.168.0.160/24   # Your Raspberry Pi ip
            static routers=192.168.0.1           # Your routers ip
            static domain_name_servers=127.0.0.1 # Any available DNS to you like 1.1.1.1 or 8.8.8.8 
        ````
    - Install Docker and Docker Compose
    - Docker:
       - https://docs.docker.com/engine/install/debian/
    - Docker Compose:
       - https://docs.docker.com/compose/install/
    - Make sure following ports are not blocked on your raspberry pi:
    ````
        - 3478/udp    Unifi Controller STUN.
        - 6789/tcp    Unifi Controller Speed Test.
        - 8080/tcp    Unifi Controller Device / Controller communication.
        - 10001/udp   Unifi Controller AP discovery.
        - 80/tcp      NGINX http port (required to redirect to 443)
        - 443/tcp     NGINX https port
        - 53tcp/udp   PiHole 
        - 67/udp      DHCP Relay
    ````
- Clone this repository to your raspberry pi.
- Edit the file `.env` and fill in your information.
- Create the necessary directories and files: `sudp ./app create`.
    - The common name (CN) for your openssl crt should be your raspberry pi's ip. 
- Now you can start everything up again: `sudo ./app start`.
- Pihole available: https://x.x.x.x/admin
- Unifi Controller: https://x.x.x.x/wss

## Usage

|Command|Description|
|---|---|
| ``app create``|create necessary files and dirs|
| ``app start``|starting up the build process and the deployment|
| ``app stop``|stop the services|
|``app update``|update the images of the services with|
|``app logs``|output the logs of all deployed services|
| ``app remove``|remove all deployed services|
