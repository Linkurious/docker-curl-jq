FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends\
    ca-certificates=20210119~20.04.2 \
    curl=7.68.0-1ubuntu2.7 \
    dnsutils=1:9.16.1-0ubuntu2.8 \
    jq=1.6-1ubuntu0.20.04.1  \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["curl"]

ARG BUILD_VERSION
LABEL maintainer="Edward Nys <edward@linkurio.us>" \
      org.opencontainers.image.description="Linkurious curl-jq" \
      org.opencontainers.image.documentation="https://github.com/Linkurious/docker-curl-jq" \
      org.opencontainers.image.title="Helper image with curl and jq for Linkurious" \
      org.opencontainers.image.url="https://github.com/Linkurious/docker-curl-jq" \
      org.opencontainers.image.vendor="Linkurious" \
      org.opencontainers.image.version="${BUILD_VERSION}"
