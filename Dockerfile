FROM ruby:2.6.3
# Man folders are here to prevent an error when installing postgre
RUN mkdir -p /usr/share/man/man1; mkdir -p /usr/share/man/man7; mkdir /myapp;
RUN apt update && apt install -y postgresql-client nodejs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler; bundle -v; bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]