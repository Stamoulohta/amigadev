

FROM alpine:latest

ARG UID=0
ARG GID=0
ARG USERNAME=root

ENV PATH="/opt/vbcc/bin:${PATH}"
ENV VBCC=/opt/vbcc

RUN apk add --no-cache --upgrade bash lha wget tar

WORKDIR /opt

RUN wget --quiet --output-document - http://www.ibaug.de/vbcc/vbcc_linux_x64.tar.gz | tar xzv

WORKDIR /workspace

RUN addgroup -g ${GID} ${USERNAME} && \
    adduser -D -u ${UID} -G ${USERNAME} -s /bin/bash ${USERNAME} && \
    chown ${USERNAME}:${USERNAME} /workspace

USER ${USERNAME}

CMD ["/usr/bin/env", "bash"]
