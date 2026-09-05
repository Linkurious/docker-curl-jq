FROM ubuntu:22.04

# renovate: datasource=repology depName=ubuntu_22_04/curl versioning=loose
ARG CURL_VERSION=7.81.0-1ubuntu1.16
# renovate: datasource=repology depName=ubuntu_22_04/bind9 versioning=loose
ARG DNSUTILS_VERSION=1:9.18.18-0ubuntu0.22.04.2
# renovate: datasource=repology depName=ubuntu_22_04/jq versioning=loose
ARG JQ_VERSION=1.6-2.1ubuntu3.2
# renovate: datasource=repology depName=ubuntu_22_04/ca-certificates versioning=loose
ARG CA_CERTIFICATES_VERSION=20230311ubuntu0.22.04.1

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends\
    ca-certificates=$CA_CERTIFICATES_VERSION \
    curl=$CURL_VERSION \
    dnsutils=$DNSUTILS_VERSION \
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
