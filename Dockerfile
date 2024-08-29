FROM openjdk:17-jdk
ARG JAR_FILE=build/libs/*.jar

COPY src /app/src
COPY webapp /app/webapp
COPY ${JAR_FILE} /app/app.jar

# 작업 디렉토리 설정
WORKDIR /app

ENTRYPOINT ["java","-Dspring.profiles.active=docker", "-jar", "app.jar"]
