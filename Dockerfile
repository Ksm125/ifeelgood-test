FROM ruby:3.2.2-alpine3.18 AS base

ENV BUNDLER_VERSION 2.4.19

RUN apk upgrade && apk add --no-cache --update build-base \
    curl \
    linux-headers \
    git \
    postgresql-dev \
    postgresql-client \
    vips \
    libheif \
    python3 \
    gcompat

RUN gem install bundler --default -v ${BUNDLER_VERSION}

FROM base

ENV USERNAME ifeelgood
ARG RAILS_ENV=production

RUN addgroup ${USERNAME}
RUN adduser --disabled-password --ingroup ${USERNAME} ${USERNAME}

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install && bundle clean --force && \
    rm -r /app/Gemfile*

RUN mkdir -p /app/tmp /app/log
RUN chown -R ${USERNAME}:${USERNAME} /usr/local/bundle/ /app
COPY --chown=$USERNAME:$USERNAME . /app

EXPOSE 3000

USER $USERNAME:$USERNAME
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
