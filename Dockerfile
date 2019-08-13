FROM ubuntu:18.04

COPY files/ /tmp/files/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git curl jq && \
    mv /tmp/files/run.sh /bin/run-wp-build && \
    mv /tmp/files/composer.json /var/composer.json && \
    rm -rf /tmp/files && \
    chmod +x /bin/run-wp-build

ENV GITHUB_AUTH_USER=""
ENV GITHUB_AUTH_PW=""

ENTRYPOINT ["/bin/run-wp-build"]
