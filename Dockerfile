FROM java:latest

RUN useradd -s /bin/bash -d /home/minecraft minecraft
RUN mkdir -p /home/minecraft
COPY src /home/minecraft
RUN chown -R minecraft:minecraft /home/minecraft

USER minecraft
WORKDIR /home/minecraft
RUN curl -Ls https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar -o minecraft_server.jar

EXPOSE 25565
CMD ["/usr/bin/java", "-Xmx1024M", "-Xms1024M", "-jar", "/home/minecraft/minecraft_server.jar", "nogui"]
