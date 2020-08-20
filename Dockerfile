FROM alpine:3

ARG HELM_VERSION
ENV HELM_VERSION=${HELM_VERSION:-"3.3.0"}

RUN apk add --no-cache \
        curl=7.69.1-r0 \
        git=2.26.2-r0

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN curl https://get.helm.sh/helm-v${HELM_VERSION}-linux-386.tar.gz | tar xvz -C /usr/local/bin --strip-components=1

RUN helm plugin install https://github.com/chartmuseum/helm-push.git

ENTRYPOINT ["helm"]
