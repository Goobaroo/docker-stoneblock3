# syntax=docker/dockerfile:1

FROM openjdk:17-jdk-buster

LABEL version="1.11.5"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB StoneBlock 3"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/27/277ea696db174dabd3cdc1ba9f6120218c8f9c6aea916855140f6be41adf821a.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://Stoneblock3:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB StoneBlock 3 v1.11.5 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]