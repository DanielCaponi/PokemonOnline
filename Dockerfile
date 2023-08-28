FROM ruby:3.0 as base

# Installing Node.js and its dependencies
RUN apt-get update -qq
RUN apt-get install -y build-essential apt-utils libpq-dev nodejs curl

WORKDIR /docker/app

RUN gem install bundler
COPY Gemfile* ./
RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT 3000
EXPOSE ${DEFAULT_PORT}

CMD ["rails","server"]
