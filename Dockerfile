FROM alpine:edge
MAINTAINER Lumos Labs <ops@lumoslabs>

CMD ["bash"]
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --update \
        atop \
        bash \
        bash-completion \
        bridge-utils \
        build-base \
        ca-certificates \
        curl \
        dstat@testing \
        file \
        gettext \
        git \
        hdparm \
        htop \
        iftop \
        iperf \
        iproute2 \
        logrotate \
        ltrace \
        nano \
        ncdu \
        ncurses \
        ncurses-terminfo \
        net-tools \
        nmap \
        obnam \
        pciutils \
        perl \
        psmisc@testing \
        pv@testing \
        python \
        ruby \
        screen \
        shadow@testing \
        speedtest-cli \
        strace \
        sysstat \
        sudo \
        tar \
        tcpdump \
        tree \
        xz \
        wget \
        zip \
        zlib-dev \
    && git clone https://github.com/rbsec/sslscan.git \
    && cd sslscan \
    && make static \
    && make install \
    && cd / \
    && apk del --purge build-base zlib-dev \
    && rm -rf sslscan /var/cache/apk/*
