FROM ruby:2.4.2-alpine

RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk upgrade --update-cache && \
    apk add --update \
              build-base \
              curl \
              libffi-dev \
              libxml2-dev \
              libxslt-dev \
              linux-headers \
              nodejs@edge \
              nodejs-npm@edge \
              postgresql-client@edge \
              postgresql-dev@edge \
              tzdata \
              zlib-dev && \
    rm -rf /tmp/* /var/lib/cache/apk/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
CMD ['bundle', 'exec', 'rails', 'server', '-b', '0.0.0.0']
