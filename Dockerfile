FROM alpine:3.9
RUN apk update && apk upgrade && apk add --no-cache openjdk8-jre tomcat-native && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* VOLUME /root/.tomcat
CMD ["/root/.tomcat/bin/catalina.sh", "run"]
