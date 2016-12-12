FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y \
   build-essential \
   locales \
   nodejs \
   libxml2-dev \
   libxslt1-dev \
   sqlite3 \
   libsqlite3-dev

ENV APP_HOME /grammars
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
