FROM swift:6.0

RUN apt-get update && apt-get install -y \
    clang \
    pkg-config \
    libicu-dev \
    libxml2-dev \
    libsqlite3-dev \
    zlib1g-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /src
WORKDIR /src

COPY .clusterfuzzlite/build.sh /src/
