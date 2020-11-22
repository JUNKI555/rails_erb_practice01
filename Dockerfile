FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client
RUN mkdir /app
WORKDIR /app

COPY . /app

# Add a script to be executed every time the container starts.
COPY ./forDocker/rails/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
