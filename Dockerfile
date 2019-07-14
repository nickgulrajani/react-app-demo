FROM alpine

ADD config/default.conf /etc/nginx/conf.d/default.conf

COPY build /var/www/localhost/htdocs

RUN apk add nginx && \
    mkdir /run/nginx;

CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /var/www/localhost/htdocs

EXPOSE 80