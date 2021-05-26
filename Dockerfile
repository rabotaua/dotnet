FROM mcr.microsoft.com/dotnet/core/sdk:2.2

RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/stretch-backports.list
RUN apt-get update
RUN apt-get install -y zip curl openjdk-11-jre

ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install --global dotnet-sonarscanner
RUN dotnet tool install --global Octopus.DotNet.Cli

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs gcc g++ make
RUN npm i -g npm typescript
