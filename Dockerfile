FROM rust:1.21

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN set -eux; \
    \
    apt update; \
    apt install -y libsqlite3-dev libpq-dev default-libmysqlclient-dev \
        cmake libssl-dev\
        python3 python3-pip; \
    apt clean;

RUN set -eux; \
    \
    cargo install diesel_cli cargo-tarpaulin; \
    pip3 install pycobertura
