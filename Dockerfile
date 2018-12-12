FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /pitzi_challange
WORKDIR /pitzi_challange
COPY Gemfile /pitzi_challange/Gemfile
COPY Gemfile.lock /pitzi_challange/Gemfile.lock
RUN bundle install
COPY . /pitzi_challange
