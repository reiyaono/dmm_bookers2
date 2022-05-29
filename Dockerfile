FROM ruby:2.6.3
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn
RUN apt-get update -qq && apt-get install -y build-essential nodejs cron
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install nodejs
# RUN apt-get update -qq && apt-get install -y stone

# RUN mysql-client

ENV APP_HOME=/app \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4

# RUN bundle install --path $BUNDLE_PATH
# RUN yarn install

WORKDIR $APP_HOME

## ADD: Copy file or directory from local machine to container
##      similar command is COPY which is not auto unzip and addable from remote
ADD Gemfile* ./
ADD package.json ./
ADD . ./