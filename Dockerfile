FROM ruby:3.2.1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

COPY Gemfile Gemfile.lock ./

RUN bundle install


COPY . .


EXPOSE 3000

CMD rails db:migrate && rails db:seed && rails server -b 0.0.0.0