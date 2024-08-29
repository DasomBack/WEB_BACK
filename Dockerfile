# FROM openjdk:17-jdk
# ARG JAR_FILE=build/libs/*.jar
#
# COPY src /app/src
# COPY src/main/webapp /app/webapp
# COPY ${JAR_FILE} /app/app.jar
#
# # 작업 디렉토리 설정
# WORKDIR /app
#
# ENTRYPOINT ["java","-Dspring.profiles.active=docker", "-jar", "app.jar"]


# Base image 선택 (Tomcat 9 버전, JDK 17 지원)
FROM tomcat:9-jdk17

# WAR 파일을 빌드 후 복사하기 위한 인자
ARG WAR_FILE=build/libs/your-application-name.war

# WAR 파일을 Tomcat의 webapps 디렉토리로 복사
COPY ${WAR_FILE} /usr/local/tomcat/webapps/ROOT.war

# Tomcat 서버 실행
CMD ["catalina.sh", "run"]
