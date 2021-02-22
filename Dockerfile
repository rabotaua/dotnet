FROM ubuntu:20.04

# timezone
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# common
RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends -y nodejs npm wget netcat curl zip apt-transport-https default-jre-headless

# dotnet
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get -qq update \
    && apt-get -qq install -y dotnet-sdk-2.1

# workaround for not supported 2.2
ADD https://dot.net/v1/dotnet-install.sh /dotnet-install.sh
RUN bash /dotnet-install.sh -Channel 2.2
ENV PATH="/root/.dotnet:${PATH}"

# node tools
RUN npm i -g --ignore-scripts apollo

# dotnet tools
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install --global dotnet-sonarscanner \
    && dotnet tool install --global Octopus.DotNet.Cli \
    && dotnet tool install --global trx2junit
