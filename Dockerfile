FROM artifacts.mastercard.int/mcr-unstable/azul/zulu-openjdk:latest

FROM maven:3.8.5-openjdk-11 AS maven_build

MAINTAINER mastercard.com
RUN echo "PWD is: $PWD"

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

# COPY ./target/nirmish-docker-app.jar nirmish-docker-app.jar

ENTRYPOINT ["java","-jar","nirmish-docker-app.jar"]
