FROM ruby:alpine
LABEL maintainer="Alphyron <admin@dragon-labs.de>"

RUN set -xe \
    && apk add --no-cache \
        libstdc++ \
        sqlite-libs \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        sqlite-dev \
    && gem install mailcatcher \
    && apk del .build-deps

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

CMD ["mailcatcher", "--no-quit", "--foreground", "--ip=0.0.0.0"]