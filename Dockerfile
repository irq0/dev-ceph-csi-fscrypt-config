FROM opensuse/tumbleweed:latest

RUN zypper --non-interactive in \
    wget \
    tar \
    git \
    go \
    pam-devel \
    attr \
    make \
    e2fsprogs \
    shadow

RUN useradd -u 999 irq0

RUN mkdir -p /go
ENV GOPATH=/go
WORKDIR /go

RUN echo $GOPATH

RUN go install github.com/google/fscrypt/cmd/fscrypt@v0.3.3
USER 999

