FROM ubuntu:16.04
MAINTAINER Your Name <your.email@example.com>

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -qqy automake libcurl4-openssl-dev git make gcc && \
    # Clone the cpuminer repository and build it
    git clone https://github.com/pooler/cpuminer && \
    cd cpuminer && \
    ./autogen.sh && \
    ./configure CFLAGS="-O3" && \
    make

# Set working directory
WORKDIR /cpuminer

# Start mining with provided arguments
ENTRYPOINT ["./minerd"]
