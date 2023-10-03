# This Dockerfile installs Docker in a Jenkins image and it is used to build other
# Jenkins Docker image agents

# Define the base image
FROM jenkins/jenkins:lts

# Switch to the Root user
USER root

# Install neccessary packages
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Request the 'Docker Engine for Linux installation script' script from the 'get.docker.com' URL
# and pipe it to directly to the 'shell' command to execute it
RUN curl -sSL https://get.docker.com/ | sh

# Add the Jenkins user to the Docker group so it can access the Docker daemon
RUN usermod -aG docker jenkins

# Set the networking version to 'legacy' and then run the 'Docker' deamon
CMD update-alternatives --set iptables /usr/sbin/iptables-legacy && dockerd