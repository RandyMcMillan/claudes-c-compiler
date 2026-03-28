FROM rust:latest

WORKDIR /usr/src/claudes-c-compiler

COPY . .

RUN cargo build --verbose

CMD ["cargo", "test", "--verbose"]
