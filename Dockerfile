FROM debian:11-slim

ARG HELM_VERSION

ENV HELM_VERSION=${HELM_VERSION:-"3.7.1"}

ENV HELM_PLUGINS=/root/.local/share/helm/plugins

RUN apt-get update && apt-get install --yes --no-install-recommends \
        git=1:2.30.2-1 \
        curl=7.74.0-1.3+b1 \
        openssl=1.1.1k-1+deb11u1 \
        ca-certificates=20210119

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl https://get.helm.sh/helm-v${HELM_VERSION}-linux-386.tar.gz | tar xvz -C /usr/local/bin --strip-components=1

RUN helm plugin install https://github.com/chartmuseum/helm-push.git
