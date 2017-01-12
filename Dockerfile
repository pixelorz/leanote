FROM alpine
RUN apk --update add curl && \
    curl -L http://downloads.sourceforge.net/project/leanote-bin/2.2.2/leanote-linux-amd64-v2.2.2.bin.tar.gz >> \
    /usr/local/leanote-linux-amd64-v2.2.2.bin.tar.gz && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

RUN tar -xzvf /usr/local/leanote-linux-amd64-v2.2.2.bin.tar.gz -C /usr/local
EXPOSE 9000
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]
