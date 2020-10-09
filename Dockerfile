FROM debian:stable-slim

ENV RAVEN_VERSION=4.3.1
ENV RAVEN_MINOR_VERSION=0
ENV RAVEN_CHECKSUM=6a11dbefe93c746a29aea21eb4392410e950cb66ae46ba14c910204eb7a9b143

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/RavenProject/Ravencoin/releases/download/v${RAVEN_VERSION}/raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${RAVEN_CHECKSUM} raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION}/bin/ravend /usr/local/bin \
    && rm -rf raven-${RAVEN_VERSION}.${RAVEN_MINOR_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/ravend"]