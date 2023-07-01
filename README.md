## Purpose
- Collection of services and applications commonly run in a homelab environment.
- docker-compose files split into categories
    - ``main``: `PiHole`, `NGINX Proxy Manager`, `Homepage` ...
    - ``monitoring``: `grafana`, `prometheus`, `influxdb`, `telegraf`, `checkmk`, `homeassistant` and more
    - ``media``: `jellyfin`, `arr-stack`, `nextcloud`, `tendoor`, `snapdrop` and more
    - ``immich``: Deploys the whole immich stack
    - ``firefliii``: Deploy necessary containers to run a firefliii instance for financial data

## Pre-Requisites
- Setup your homelab
  - Install Docker and Docker Compose
  - Docker:
     - https://docs.docker.com/engine/install/
  - Docker Compose:
     - Docker Compose plugin is now being shipped with the standard docker installation
- Clone this repository onto your machine.
- Edit the `.env` files and fill in your information.
- Start the project: `./app start`.
- Examples
  - Pihole: http://x.x.x.x/admin
  - NGINX: http://x.x.x.x:81/login

## Usage

| Command        | Description                                      |
|----------------|--------------------------------------------------|
| ``app start``  | starting up the build process and the deployment |
| ``app stop``   | stop the services                                |
| ``app update`` | update the images of the services with           |
| ``app logs``   | output the logs of all deployed services         |
| ``app remove`` | remove all deployed services                     |
