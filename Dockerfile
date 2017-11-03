FROM rust

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

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

RUN chmod -R a+w $RUSTUP_HOME $CARGO_HOME;
