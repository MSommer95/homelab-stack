FROM nginx:1.21.4

COPY ./nginx.conf.TEMPLATE /nginx.conf.TEMPLATE
CMD ["/bin/sh" , "-c" , "envsubst '$IP_ADDRESS $PROJECT_NAME' < /nginx.conf.TEMPLATE > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]
