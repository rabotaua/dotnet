FROM microsoft/dotnet

RUN apt-get update
RUN apt-get install -y zip curl openjdk-8-jre

ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install --global dotnet-sonarscanner
RUN dotnet tool install --global Octopus.DotNet.Cli

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs gcc g++ make
RUN npm i -g npm typescript
