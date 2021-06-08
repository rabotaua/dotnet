FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y zip curl openjdk-11-jre wget

RUN wget https://download.visualstudio.microsoft.com/download/pr/022d9abf-35f0-4fd5-8d1c-86056df76e89/477f1ebb70f314054129a9f51e9ec8ec/dotnet-sdk-2.2.207-linux-x64.tar.gz \
    && mkdir -p /root/dotnet \
    && tar zxf dotnet-sdk-2.2.207-linux-x64.tar.gz -C /root/dotnet \
    && rm dotnet-sdk-2.2.207-linux-x64.tar.gz

ENV DOTNET_ROOT=/root/dotnet
ENV PATH=$PATH:/root/dotnet
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
ENV PATH=/root/.dotnet/tools:${PATH}

RUN dotnet tool install --global dotnet-sonarscanner
RUN dotnet tool install --global Octopus.DotNet.Cli

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs gcc g++ make
RUN npm i -g npm typescript
