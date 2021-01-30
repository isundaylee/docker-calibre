FROM ghcr.io/linuxserver/calibre:version-v5.10.1

COPY patches /opt/calibre-patches

RUN apt-get update && \
    apt-get install -y \
        patch

RUN for file in $(find /opt/calibre-patches -type f); do \
        patch -d /opt/calibre -p1 < $file; \
    done
