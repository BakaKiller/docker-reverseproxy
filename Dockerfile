FROM nginx:stable

RUN apt update && apt install openssl -y

ARG SSL_ON
ARG PHP_PORT
ARG PHP_PORT_SSL
ARG PMA_PORT
ARG PMA_PORT_SSL
ARG HOST

ENV SSL_ON=${SSL_ON}
ENV PHP_PORT=${PHP_PORT}
ENV PHP_PORT_SSL=${PHP_PORT_SSL}
ENV PMA_PORT=${PMA_PORT}
ENV PMA_PORT_SSL=${PMA_PORT_SSL}
ENV HOST=${HOST}

RUN mkdir -p /etc/ssl

RUN if [ "${SSL_ON}" = "1" ]; then\
        openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
        -subj "/C=FR/L=Toulouse/O=Andil/CN=${HOST}" \
        -keyout /etc/ssl/${HOST}.key  -out /etc/ssl/${HOST}.cert;\
    fi

RUN echo "# Add config here with addurl" > /etc/nginx/conf.d/proxy.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD nginx -g "daemon off;"
