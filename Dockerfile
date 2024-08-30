# FROM openjdk:17-jdk
# ARG JAR_FILE=build/libs/*.war
# COPY ${JAR_FILE} app.war
# ENTRYPOINT ["java","-Dspring.profiles.active=docker", "-jar", "app.war"]

FROM tomcat:9-jdk17

ARG WAR_FILE=build/libs/*.war

COPY ${WAR_FILE} /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
