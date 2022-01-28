FROM ruby:2.7

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN apt-get update && apt-get install -y nodejs postgresql-client locales

ENV RAILS_SERVE_STATIC_FILES 1
# ENV rest_searcher_DATABASE_PASSWORD password

RUN gem install bundler

RUN mkdir /rest_searcher
WORKDIR /rest_searcher
COPY Gemfile /rest_searcher/Gemfile
COPY Gemfile.lock /rest_searcher/Gemfile.lock
COPY . /rest_searcher

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN locale-gen ja_JP.UTF-8
# timezoneをJSTに変更
RUN apt-get install -y tzdata \
  && rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata
# キャッシュ削除
RUN rm -rf /var/lib/apt/lists/*
EXPOSE 3000

RUN rails webpacker:install

RUN rm -f config/credentials.yml.enc
RUN rm -f config/master.key
