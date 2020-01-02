FROM ubuntu:latest as base

RUN apt-get update 
RUN apt-get install -y lsb-release curl tzdata

FROM base as stage1

RUN apt-get install -y texlive-latex-base-doc

FROM stage1 as stage2
RUN apt-get install -y texlive-latex-extra-doc

FROM stage2 as stage3
RUN apt-get install -y texlive-latex-recommended-doc

FROM stage3 as stage4
RUN apt-get install -y texlive-pictures-doc

FROM stage4 as stage5
RUN apt-get install -y texlive-pstricks-doc

FROM stage5 as stage6
RUN apt-get install -y texlive-fonts-extra

FROM stage6 as stage7
RUN apt-get install -y texlive-fonts-extra-doc

FROM stage7 as stage8
RUN apt-get install -y texlive-lang-english


FROM stage8 as stage9
RUN apt-get install -y texlive-full

RUN lsb_release -a