FROM ruby:2.7.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN adduser --disabled-password --gecos '' deploy
USER deploy
RUN mkdir /home/deploy/od-ot
WORKDIR /home/deploy/od-ot

ADD Gemfile /home/deploy/od-ot
ADD Gemfile.lock /home/deploy/od-ot

ENV BUNDLER_VERSION 1.17.3
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install
