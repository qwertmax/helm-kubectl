FROM alpine:3.11

ARG VCS_REF
ARG BUILD_DATE

# Metadata

ENV KUBE_LATEST_VERSION="v1.18.2"
ENV HELM_VERSION="v3.2.0"

RUN apk add --no-cache ca-certificates bash git openssh curl python py-pip \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \

RUN pip install awscli

WORKDIR /config

CMD bash