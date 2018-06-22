FROM openjdk:8-jre-alpine

LABEL Author="Sébastien Rault"

ENV USER_APP=jdownloader

RUN apk add --no-cache su-exec && \
    adduser -D "${USER_APP}" && \
	wget -O /usr/local/lib/jdownloader.jar http://installer.jdownloader.org/JDownloader.jar && \
    ln /usr/local/lib/jdownloader.jar /home/$USER_APP/JDownloader.jar && \
    chown "${USER_APP}" /home/jdownloader/JDownloader.jar && \
    su-exec "${USER_APP}" java -Djava.awt.headless=true -jar /home/jdownloader/JDownloader.jar

COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ] 
CMD [ "java", "-Djava.awt.headless=true" ]