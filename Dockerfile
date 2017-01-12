FROM alpine
RUN apk --update add curl && \
    curl -L http://sourceforge.net/projects/leanote-bin/files/1.4.2/leanote-linux-amd64-v1.4.2.bin.tar.gz/download >> \
    /usr/local/leanote-linux-amd64-v1.4.2.bin.tar.gz && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

RUN tar -xzvf /usr/local/leanote-linux-amd64-v1.4.2.bin.tar.gz -C /usr/local
EXPOSE 9000
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]