FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive

# Install base instance
RUN mkdir -p /var/cache/apt/archives
RUN apt-get -y update && \
    apt-get -y upgrade

RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y sudo  wget unzip texlive-latex-extra texlive-xetex texlive-extra-utils texlive-fonts-extra texlive-latex-recommended texlive-full lyx latex2html firefox-esr \
# Easy_install
    git \
# Ssh
    ssh sshpass openssh-server \
# Vim
    vim \
# Shell
    zsh \
# Local
    locales

# Remove proxy
ENV http_proxy ""
ENV https_proxy ""

# QA-tools
RUN mkdir -p /home/cv 
WORKDIR /home/cv

# Configure locale
RUN locale-gen     fr_FR.UTF-8
RUN update-locale  fr_FR.UTF-8


#locale
ENV SHELL /bin/bash

RUN mkdir -p /tmp

#ADD /home/pierre/PERSO/CV /home/cv

