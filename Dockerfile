FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cpio \
    clang \
    curl \
    libbz2-dev \
    liblzma-dev \
    libssl-dev \
    libxml2-dev \
    openssl \
    zlib1g-dev

# build and install xar
RUN curl -sfLO https://github.com/downloads/mackyle/xar/xar-1.6.1.tar.gz && \
    tar -xzf xar-1.6.1.tar.gz && \
    rm xar-1.6.1.tar.gz && \
    cd xar-1.6.1 && \
    ./configure --prefix /usr && \
    make && \
    make install && \
    rm -rf /xar-1.6.1

# build and install pbzx
RUN curl -sfLO https://github.com/NiklasRosenstein/pbzx/archive/v1.0.2.tar.gz && \
    tar -xzvf v1.0.2.tar.gz && \
    rm v1.0.2.tar.gz && \
    cd pbzx-1.0.2 && \
    clang -llzma -lxar -I /usr/local/include pbzx.c -o pbzx && \
    mv pbzx /usr/local/bin && \
    rm -rf /pbzx-1.0.2
