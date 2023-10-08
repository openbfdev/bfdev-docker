FROM alpine
WORKDIR /root
RUN apk --update add musl-dev git cmake make gcc && \
    git clone https://github.com/openbfdev/bfdev.git && \
    cd bfdev && \
    cmake -B build -D BFDEV_EXAMPLES=ON -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release && \
    cmake --build build --config=Release && \
    cmake --build build -- install && \
    apk del git cmake make
