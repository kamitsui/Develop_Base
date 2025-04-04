# Base Image
FROM ubuntu:22.04

# Set non-interactive mode for APT
ENV DEBIAN_FRONTEND=noninteractive \
	LANG=ja_JP.UTF-8 \
	LANGUAGE=ja_JP:ja \
	LC_ALL=ja_JP.UTF-8 \
	TZ=Asia/Tokyo

#RUN DEBIAN_PRIORITY=critical apt-get update && apt-get install -y \
#    keyboard-configuration \
#    console-setup \
#	&& apt-get clean

# Install essential packages and Japanese support
RUN DEBIAN_PRIORITY=critical apt-get update && apt-get install -y \
	# time synchronization \
	locales \
	tzdata \
	ibus \
	ibus-mozc \
	fonts-noto-cjk \
	&& apt-get clean

# Configure Japanese locale
RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    update-locale LANG=ja_JP.UTF-8

# Set timezone to Japan
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Install necessary dependencies
RUN DEBIAN_PRIORITY=critical apt-get update && apt-get install -y \
	keyboard-configuration \
	console-setup \
	libx11-dev \
	libxext-dev \
	libxrandr-dev \
	libxinerama-dev \
	libxcursor-dev \
	libxi-dev \
	x11-apps \
	mesa-utils \
	xorg \
	openbox \
	libglu1-mesa-dev freeglut3-dev mesa-common-dev \
	libgl1-mesa-glx \
	libgl1-mesa-dri \
	mesa-utils \
	build-essential \
	zlib1g-dev \
	libbsd-dev \
	clang \
	cmake \
	git \
	valgrind \
	wget \
	vim fzf \
	silversearcher-ag \
	# documantation \
	doxygen \
	graphviz \
	inotify-tools \
	npm \
	&& npm install -g live-server \
	&& apt-get clean

# Create working directory inside the container
WORKDIR /app

# Expose the live-server port
EXPOSE 8080

# Set entry point to bash
CMD ["bash"]
