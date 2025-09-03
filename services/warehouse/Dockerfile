FROM ruby:3.2-alpine
RUN apk add --no-cache build-base tzdata mysql-client mariadb-connector-c-dev
WORKDIR /app
COPY Gemfile Gemfile.lock* /app/
RUN bundle install
COPY . /app
CMD ["ruby", "worker.rb"]