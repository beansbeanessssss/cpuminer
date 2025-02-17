FROM ubuntu:16.04
MAINTAINER Your Name <your.email@example.com>

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -qqy automake libcurl4-openssl-dev git make gcc && \
    # Clone the cpuminer repository
    git clone https://github.com/pooler/cpuminer && \
    # Navigate into the repository
    cd cpuminer && \
    # Build cpuminer
    ./autogen.sh && \
    ./configure CFLAGS="-O3" && \
    make

# Set the working directory
WORKDIR /cpuminer

# Define the entry point
ENTRYPOINT ["./minerd"]
