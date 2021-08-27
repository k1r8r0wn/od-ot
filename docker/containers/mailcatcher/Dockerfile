FROM debian:stable

RUN apt-get update && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    ruby \
    ruby-dev && \
    gem install --no-document mailcatcher && \
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

EXPOSE 1080 1025
