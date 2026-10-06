FROM debian:trixie-slim

# renovate: datasource=custom.debian-trixie depName=curl versioning=loose
ARG CURL_VERSION=8.14.1-2+deb13u5
# renovate: datasource=custom.debian-trixie depName=bind9-dnsutils versioning=loose
ARG DNSUTILS_VERSION=1:9.20.29-1~deb13u1
# renovate: datasource=custom.debian-trixie depName=jq versioning=loose
ARG JQ_VERSION=1.7.1-6+deb13u4
# renovate: datasource=custom.debian-trixie depName=ca-certificates versioning=loose
ARG CA_CERTIFICATES_VERSION=20250419

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
