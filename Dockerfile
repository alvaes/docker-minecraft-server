FROM ubuntu:latest

#install java and dependencies
USER root

RUN apt update -y && apt upgrade -y
RUN apt install openjdk-21-jdk-headless openjdk-21-jre-headless wget -y

RUN mkdir /minecraft_server
#Create Workdir for server
WORKDIR /minecraft_server

#Download Minecraft Server
RUN wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar

#First server execution
RUN java -Xms1024M -Xmx1024M -jar server.jar nogui

#Accept EULA
RUN sed -i 's/\bfalse\b/TRUE/' eula.txt

#Run server
CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "server.jar", "nogui"]

#Expose server ports
EXPOSE 25565 25575
