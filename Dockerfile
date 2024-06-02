FROM debian:bullseye as taginfo-tools

RUN set -eux ;\
    DEBIAN_FRONTEND=noninteractive apt-get update ;\
    DEBIAN_FRONTEND=noninteractive apt-get install  -y --no-install-recommends \
        build-essential \
        cmake \
        libbz2-dev \
        libexpat1-dev \
        libgd-dev \
        libicu-dev \
        libosmium2-dev \
        libprotozero-dev \
        libsqlite3-dev \
        make \
        zlib1g-dev \
        git \
        ca-certificates

WORKDIR /code

RUN git clone --recurse-submodules https://github.com/taginfo/taginfo-tools.git && \
    cd taginfo-tools && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

FROM ruby:3.3-bullseye

RUN set -eux ;\
    DEBIAN_FRONTEND=noninteractive apt-get update ;\
    DEBIAN_FRONTEND=noninteractive apt-get install  -y --no-install-recommends \
        # taginfo depedencies
        sqlite3 \
        libgd3 \
        # Filter osm file
        osmium-tool


WORKDIR /code

ENV GEM_HOME=/usr/local/lib/ruby/gems/3.1.0
ENV TAGINFO_RUBY=/usr/local/bin/ruby

RUN git clone https://github.com/taginfo/taginfo.git && \
    cd taginfo && \
    gem install sqlite3

COPY --from=taginfo-tools /code/taginfo-tools/build/src taginfo-tools
