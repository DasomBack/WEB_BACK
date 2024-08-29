FROM openjdk:17-jdk
ARG JAR_FILE=build/libs/*.jar
COPY src ./src
COPY webapp ./src/main/webapp
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dspring.profiles.active=docker", "-jar", "app.jar"]
