FROM ekidd/rust-musl-builder:stable as build

USER root

# empty shell project
RUN cargo new --bin ch20httpd
WORKDIR ./ch20httpd

# build just dependencies
COPY ./rust-book-exercises/ch20httpd/Cargo.lock ./Cargo.lock
COPY ./rust-book-exercises/ch20httpd/Cargo.toml ./Cargo.toml
RUN cargo build --release
RUN rm src/*.rs

# build static linked release
ADD ./rust-book-exercises/ch20httpd/ ./
RUN cargo build --release


##
# final image
##
FROM alpine

RUN mkdir /app
WORKDIR /app
COPY --from=build /home/rust/src/ch20httpd/target/x86_64-unknown-linux-musl/release/ch20httpd .

CMD ["/app/ch20httpd"]


## copied from rust-book-exercises/ch20httpd
## --snip--


ENV PORT=80
ENV WWWROOT=/app/wwwroot

ADD ./localhost\:8000/ /app/wwwroot/

