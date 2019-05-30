FROM adoptopenjdk:12.0.1_12-jre-openj9-0.14.1
VOLUME /tmp
COPY target/lib/ lib/
ADD target/*.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS="-Duser.timezone=Asia/Shanghai"
ENV APP_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.ext.dirs=./lib -Djava.security.egd=file:/dev/./urandom -jar /app.jar $APP_OPTS" ]