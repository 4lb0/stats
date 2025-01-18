ARG BIALET_VERSION=0.7

# Install library dependencies
FROM alpine:latest AS base
RUN apk add musl-dev sqlite-dev openssl-dev curl-dev

# Install compilation tools
FROM base AS build
ARG BIALET_VERSION
RUN apk add gcc make python3
WORKDIR /bialet-$BIALET_VERSION
RUN wget https://github.com/bialet/bialet/archive/refs/tags/v$BIALET_VERSION.zip
RUN unzip v$BIALET_VERSION.zip -d ../
RUN make clean && make

# Copy bialet binary
FROM base AS run
ARG BIALET_VERSION
COPY --from=build /bialet-$BIALET_VERSION/build/bialet /usr/local/bin/bialet

EXPOSE 7000

ENTRYPOINT ["bialet", "-h", "0.0.0.0", "/var/www/"]
