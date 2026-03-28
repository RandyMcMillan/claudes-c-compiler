FROM rust:slim AS builder

WORKDIR /usr/src/ccc

COPY Cargo.toml ./
COPY src ./src
COPY include ./include

RUN cargo build --release

FROM debian:bookworm-slim

COPY --from=builder /usr/src/ccc/target/release/ccc \
                    /usr/src/ccc/target/release/ccc-x86 \
                    /usr/src/ccc/target/release/ccc-arm \
                    /usr/src/ccc/target/release/ccc-riscv \
                    /usr/src/ccc/target/release/ccc-i686 \
                    /usr/local/bin/

ENTRYPOINT ["ccc"]
