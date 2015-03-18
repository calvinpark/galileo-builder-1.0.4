# Intel Galileo BSP builder
#
# Version	1.0

FROM		ubuntu:14.04
MAINTAINER	Calvin Sangbin Park <calvinspark@gmail.com>

# Use bash. I like bash.
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && apt-get install -y \
	autoconf autopoint \
	build-essential \
	chrpath connect-proxy curl \
	diffstat \
	expect \
	gawk gcc-multilib git \
	iasl \
	libcurl4-openssl-dev libssl-dev libtool \
	openjdk-7-jdk \
	subversion \
	texinfo \
	uuid-dev \
	vim-common \
	wget

# tar needs to be downgraded to 1.26
RUN wget http://mirrors.kernel.org/ubuntu/pool/main/t/tar/tar_1.26-4ubuntu1_amd64.deb \
    && dpkg --install tar_1.26-4ubuntu1_amd64.deb \
    && rm tar_1.26-4ubuntu1_amd64.deb

# Add a non-root user
RUN adduser --disabled-password --gecos "" galileo && passwd -d galileo
ENV HOME /home/galileo
ENV TERM xterm
USER galileo

# Set up default git identity
RUN git config --global user.email "galileo@galileo-builder-1.0.4" \
    && git config --global user.name "Galileo"

# Work from the /tmp directory for shorter path length
WORKDIR /tmp

# Get the source
# Not using ADD per https://docs.docker.com/articles/dockerfile_best-practices/
RUN curl -SL https://github.com/01org/Galileo-Runtime/archive/1.0.4.tar.gz -o Galileo-Runtime-1.0.4.tar.gz \
	&& tar -xf Galileo-Runtime-1.0.4.tar.gz

# Set the extracted source dir as the working directory
WORKDIR /tmp/Galileo-Runtime-1.0.4

# Extract and patch
RUN tar -xf meta-clanton_*.tar.gz && tar -xf patches_*.tar.gz
RUN patches_*/patch.meta-clanton.sh

# Edit the BB threads info and welcome the user
COPY ./entry.sh /
ENTRYPOINT ["/entry.sh"]
