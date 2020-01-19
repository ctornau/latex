FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y lsb-release && \
    apt-get install -y curl && \
    apt-get install -y tzdata && \
    apt-get install -y texlive-full && \
    apt-get purge -y *-doc && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN lsb_release -a