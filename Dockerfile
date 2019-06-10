FROM microsoft/dotnet

RUN apt-get update
RUN apt-get install -y zip curl openjdk-8-jre

ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install --global dotnet-sonarscanner
RUN dotnet tool install --global Octopus.DotNet.Cli
