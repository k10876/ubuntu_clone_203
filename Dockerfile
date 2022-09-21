#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:22.10

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y joe mc net-tools openssh-server byobu nano curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*
# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
# ENV HOME /root

# Define working directory.
WORKDIR /root

# Open SSH port
EXPOSE 22/tcp
EXPOSE 443/tcp
EXPOSE 3389
EXPOSE 8080
EXPOSE 19910

# Define default command.
CMD ["bash"]

# Start ssh 
CMD ["service ssh start"]
