# Define the base image
FROM jenkins/jenkins:lts

# Switch to the Root user
USER root

# Install dependencies 
RUN apt-get update && apt-get install wget
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Install .NET SDK 6.0
RUN apt-get update; 
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-6.0
RUN dotnet --version

# Switch back to the Jenkins user
USER jenkins

