FROM ruby:3.1.2-alpine

RUN apk add --update --no-cache \
      yarn \
      build-base \
      postgresql-dev \
      tzdata \
      git \ 
      && rm -rf /var/cache/apk/* 

RUN gem install rails

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . ./

EXPOSE 3000

CMD [ "bin/rails", "s", "-b", "0.0.0.0" ]