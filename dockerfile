FROM denoland/deno:alpine

RUN apt-get update && \
    apt-get install -y git curl build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
    --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz && \
    mkdir /home/playground

WORKDIR /home/playground

CMD ["code", "tunnel", "--accept-server-license-terms"]
