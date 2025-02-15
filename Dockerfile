FROM openjdk:8u212-alpine

LABEL name "Springboot base image" 
LABEL maintainer "Emanuel"
LABEL version=1.0
COPY target/spring-boot-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]