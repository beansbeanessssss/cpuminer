FROM ubuntu:16.04
MAINTAINER Guillaume J. Charmes <guillaume@charmes.net>

RUN apt-get update -qq && \
    apt-get install -qqy automake libcurl4-openssl-dev git make gcc

WORKDIR /app
RUN git clone https://github.com/pooler/cpuminer.git

WORKDIR /app/cpuminer
RUN ./autogen.sh && \
    ./configure CFLAGS="-O3" && \
    make

ENTRYPOINT ["./minerd"]
