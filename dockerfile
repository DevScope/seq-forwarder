FROM debian:latest
RUN apt update
RUN apt install liblmdb-dev libicu-dev libicu67 -y
COPY ./seqfwd-2.1.128-linux-x64.tar.gz /seqfwd.tar.gz
COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
RUN tar  -xvzf /seqfwd.tar.gz
WORKDIR /seqfwd-2.1.128-linux-x64
RUN ./seqfwd config -k api.listenUri --value="http://0.0.0.0:80"
CMD /docker-entrypoint.sh
