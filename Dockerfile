FROM debian:stable-slim

ENV RAVEN_VERSION=2.5.1
ENV RAVEN_MINOR_VERSION=0
ENV RAVEN_CHECKSUM=efb758150337a37316fa612d1437716bbaf8caa4bf9b4fd4396bd414578e3b7f

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/RavenProject/Ravencoin/releases/download/v${RAVEN_VERSION}/raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${RAVEN_CHECKSUM} raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}/bin/ravend /usr/local/bin \
    && rm -rf raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/ravend"]