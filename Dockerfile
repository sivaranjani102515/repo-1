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

RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
RUN bundle exec rake db:migrate

COPY . ./

EXPOSE 3000

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb"]
