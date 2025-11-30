

FROM alpine:latest

ARG DEVUID=1000
ARG DEVGID=1000
ARG DEVNAME=developer

ENV PATH="/opt/vbcc/bin:${PATH}"
ENV VBCC=/opt/vbcc
ENV NDK=/opt/ndk39/NDK_3.9
ENV NDKI=$NDK/Include/include_h
ENV NDKL=$NDK/Include/linker_libs

RUN apk add --no-cache --upgrade bash wget 7zip

WORKDIR /opt

RUN wget http://www.ibaug.de/vbcc/vbcc_linux_x64.tar.gz && \
    7zz x vbcc_linux_x64.tar.gz && \
    7zz x vbcc_linux_x64.tar -o/opt && \
    rm -f vbcc_linux_x64.*

RUN wget https://os.amigaworld.de/download.php?id=3 -O NDK39.lha && \
    7zz x -o/opt NDK39.lha NDK_3.9/Include/* && \
    rm -f NDK39.lha

RUN find /opt -type d -exec chmod 755 {} \+ && \
    find /opt -type f ! -path "**/bin/*" -exec chmod 644 {} \+ && \
    find /opt/vbcc/bin -type f -exec chmod 755 {} \+

WORKDIR /workspace

RUN addgroup -g ${DEVGID} ${DEVNAME} && \
    adduser -D -u ${DEVUID} -G ${DEVNAME} -s /bin/bash ${DEVNAME} && \
    chown ${DEVNAME}:${DEVNAME} /workspace

USER ${DEVNAME}

CMD ["sleep", "infinity"]
