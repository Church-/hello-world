FROM ruby:2.4.0
ADD Gemfile /app/
ADD Gemfile.lock /app/
ADD Rakefile /app/
ADD . /app/
RUN gem install bundler --no-ri --no-rdoc && \
    cd /app ; bundle install && \
    rake

RUN chown -R nobody:nogroup /app
USER nobody
ENV RACK_ENV development
EXPOSE 3000
WORKDIR /app
CMD ["rails", "server"]
