FROM node:24-bookworm-slim AS node

FROM ubuntu:24.04

RUN usermod --login salla --home /home/salla --move-home ubuntu \
    && groupmod --new-name salla ubuntu

ARG SALLA_CLI_VERSION=latest

ENV LANG=C.UTF-8 \
    NPM_CONFIG_PREFIX=/opt/npm-global \
    PATH=/opt/npm-global/bin:$PATH

# Node's official binaries run on Ubuntu; the final OS remains Ubuntu.
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/lib/node_modules/npm /usr/local/lib/node_modules/npm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bubblewrap ca-certificates curl git openssh-client unzip xz-utils libstdc++6 \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
    && mkdir -p /opt/npm-global /workspace \
    && npm install --global "@salla.sa/cli@${SALLA_CLI_VERSION}" @openai/codex \
    && codex --version \
    && npm cache clean --force \
    && chown -R salla:salla /opt/npm-global /home/salla /workspace

USER salla
WORKDIR /workspace

CMD ["sleep", "infinity"]
