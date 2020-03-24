FROM debian:stable-slim

ENV RAVEN_VERSION=3.3.2
ENV RAVEN_MINOR_VERSION=0
ENV RAVEN_CHECKSUM=a957e88e35f3eab1a780323b9ff62b1de18a27d1bf7895d6ecda599a29735215

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/RavenProject/Ravencoin/releases/download/v${RAVEN_VERSION}/raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${RAVEN_CHECKSUM} raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}/bin/ravend /usr/local/bin \
    && rm -rf raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/ravend"]