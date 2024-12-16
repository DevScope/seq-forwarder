FROM debian:latest

RUN apt update
RUN apt install liblmdb-dev curl -y

RUN curl http://ftp.de.debian.org/debian/pool/main/i/icu/libicu67_67.1-7_amd64.deb
RUN apt install libicu67_67.1-7_amd64.deb -y
RUN rm libicu67_67.1-7_amd64.deb

COPY ./seqfwd-2.1.128-linux-x64.tar.gz /seqfwd.tar.gz
COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
RUN tar  -xvzf /seqfwd.tar.gz

WORKDIR /seqfwd-2.1.128-linux-x64
RUN ./seqfwd config -k api.listenUri --value="http://0.0.0.0:80"

CMD /docker-entrypoint.sh
