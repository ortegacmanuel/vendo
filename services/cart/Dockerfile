FROM ruby:3.2-alpine

# Install required build tools and headers
# - git (for git-sourced gems like eventstore-ruby)
# - build-base (compilers, make, etc.)
# - tzdata (timezone data)
# - postgresql-dev (headers for pg gem)
# - yaml-dev (headers for psych gem)
RUN apk add --no-cache git build-base tzdata postgresql-dev yaml-dev

# Force Bundler to build native gems for Alpine (musl) instead of using glibc precompiled ones
ENV BUNDLE_FORCE_RUBY_PLATFORM=1

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock* /app/
RUN bundle install

# Copy the application code
COPY . /app

EXPOSE 9292

# Boot the service with rackup (reads config.ru)
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "9292"]