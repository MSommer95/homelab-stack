## Purpose
- Deployment:
    - unifi controller
    - pi-hole
    - nginx reverse proxy

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
- Clone this repository to your raspberry pi.
- Edit the file `.env` and fill in your information.
- Execute the app script: `sudo ./app start`
- Once everything is started stop every container `sudo ./app stop`:
    - To make the pihole work properly you have to now add the following file:
    - `07-dhcp-options.conf` with this line `dhcp-option=option:dns-server,x.x.x.x` where x.x.x.x is your raspberry pi's ip.
- Now you can start everything up again: `sudo ./app start`.
- Pihole available: https://x.x.x.x/admin
- Unifi Controller: https://x.x.x.x/wss 

## Usage

|Command|Description|
|---|---|
| ``app start``|starting up the build process and the deployment|
| ``app stop``|stop the services|
|``app update``|update the images of the services with|
|``app logs``|output the logs of all deployed services|
| ``app remove``|remove all deployed services|
