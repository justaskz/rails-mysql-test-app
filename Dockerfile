FROM ruby:2.6.5-stretch

ENV VOLUME /volume
# ENV GEM_HOME $VOLUME
# ENV BUNDLE_PATH $VOLUME
# ENV BUNDLE_BIN_PATH $VOLUME/ruby/2.6.0/bin
# ENV PATH=$BUNDLE_BIN_PATH:$PATH

ENV RAILS_ENV production
# ENV DATABASE_HOST=192.168.33.11
ENV DATABASE_HOST=127.0.0.1
ENV DATABASE_PORT=3306
ENV RAILS_MYSQL_TEST_APP_DATABASE_USERNAME=root
ENV RAILS_MYSQL_TEST_APP_DATABASE_PASSWORD=a
ENV REDIS_URL=redis://172.17.0.1:6379/1

WORKDIR /application
COPY Gemfile /application
COPY Gemfile.lock /application
RUN bundle install --deployment --without development test

COPY . /application

# ENTRYPOINT bundle exec rails server

# ENTRYPOINT [ "/bin/bash /application/scripts/server" ]
ENTRYPOINT ["/bin/bash"]
