FROM ubuntu:latest

RUN apt-get update && apt-get install -y lsb-release curl tzdata texlive-full

RUN lsb_release -a