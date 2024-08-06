FROM alpine:3 as builder

RUN apk add --no-cache git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev

RUN git clone https://github.com/xmrig/xmrig

WORKDIR /xmrig

RUN sed -i 's/constexpr const int kDefaultDonateLevel = 1;/constexpr const int kDefaultDonateLevel = 0;/g' src/donate.h && \
    sed -i 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h

RUN mkdir build && cd build && \
    cmake .. && \
    make -j$(nproc) && \
    chmod +x xmrig


FROM alpine:3

COPY --from=builder /xmrig/build/xmrig /usr/local/bin/xmrig

WORKDIR /usr/local/bin

ENTRYPOINT ["./xmrig"]

