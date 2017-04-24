FROM ubuntu:16.04

RUN apt-get update; apt-get install -y wget && \
    wget https://dl.winehq.org/wine-builds/Release.key && \
    apt-key add Release.key && \
    dpkg --add-architecture i386 && \
    echo "deb http://dl.winehq.org/wine-builds/ubuntu/ xenial main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y winehq-stable && \
    wget http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi -P /usr/share/wine/gecko && \
    wget http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi -P /usr/share/wine/gecko && \
    wget http://dl.winehq.org/wine/wine-mono/4.6.4/wine-mono-4.6.4.msi -P /usr/share/wine/mono

ENTRYPOINT ["wine"] 
