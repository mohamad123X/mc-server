FROM eclipse-temurin:25-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget
RUN mkdir -p plugins
# تحميل الأساسيات
RUN wget -O paper.jar https://fill-data.papermc.io/v1/objects/cfb9281c2657e21ecc8acdaa9efbd6b5b3e873fb5bac4c3b8ba4bba67aa13ee2/paper-26.1.2-65.jar
RUN wget -O plugins/LuckPerms.jar https://download.luckperms.net/1539/bukkit/loader/LuckPerms-Bukkit-5.4.143.jar
RUN wget -O plugins/EssentialsX.jar https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsX-2.20.1.jar
RUN wget -O plugins/WorldGuard.jar https://dev.bukkit.org/projects/worldguard/files/latest
RUN wget -O plugins/WorldEdit.jar https://dev.bukkit.org/projects/worldedit/files/latest
RUN wget -O plugins/playit.jar https://github.com/playit-cloud/playit-minecraft-plugin/releases/latest/download/playit-minecraft-plugin.jar
# إعدادات أوتوماتيكية
RUN echo "eula=true" > eula.txt
RUN echo "online-mode=false" > server.properties
RUN echo "motd=NetPulse V3 Server" >> server.properties
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "paper.jar"]
