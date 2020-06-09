FROM ruby:2.7.1-buster
WORKDIR /app
RUN apt update && apt install -y default-mysql-client
