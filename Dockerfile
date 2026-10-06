FROM ubuntu:26.04

# renovate: datasource=deb depName=curl versioning=deb
ARG CURL_VERSION=8.18.0-1ubuntu2.7
# renovate: datasource=deb depName=bind9-dnsutils versioning=deb
ARG DNSUTILS_VERSION=1:9.20.24-1ubuntu0.3
# renovate: datasource=deb depName=jq versioning=deb
ARG JQ_VERSION=1.8.1-4ubuntu2
# renovate: datasource=deb depName=ca-certificates versioning=deb
ARG CA_CERTIFICATES_VERSION=20260601~26.04.1

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends\
    ca-certificates=$CA_CERTIFICATES_VERSION \
    curl=$CURL_VERSION \
    bind9-dnsutils=$DNSUTILS_VERSION \
    jq=$JQ_VERSION \
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
