FROM debian:10-slim

ARG HELM_VERSION

ENV HELM_VERSION=${HELM_VERSION:-"3.6.0"}

ENV HELM_PLUGINS=/root/.local/share/helm/plugins

RUN apt-get update && apt-get install --yes --no-install-recommends \
        git=1:2.20.1-2+deb10u3 \
        curl=7.64.0-4+deb10u2 \
        openssl=1.1.1d-0+deb10u6 \
        ca-certificates=20200601~deb10u2

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl https://get.helm.sh/helm-v${HELM_VERSION}-linux-386.tar.gz | tar xvz -C /usr/local/bin --strip-components=1

RUN helm plugin install https://github.com/chartmuseum/helm-push.git
