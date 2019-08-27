FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive

# Install base instance
RUN mkdir -p /var/cache/apt/archives
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y \
# latex
texlive-latex-base texlive-latex-extra texlive-fonts-extra texlive-lang-french \
# Other Packages
git locales

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
ENV SHELL /bin/zsh
RUN mkdir -p /tmp

