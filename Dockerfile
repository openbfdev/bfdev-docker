FROM alpine
WORKDIR /root
RUN apk --update add musl-dev bash git cmake make gcc && \
    git clone https://github.com/openbfdev/bfdev.git && \
    cd bfdev && \
    cmake -Bbuild -DBFDEV_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --config=Release -j$(nproc) && \
    cmake --build build -- install
