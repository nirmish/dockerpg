FROM adoptopenjdk/openjdk11:alpine-jre

FROM maven:3.9-amazoncorretto-17 AS maven_build

MAINTAINER mastercard.com
RUN echo "PWD is:" $PWD

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn clean install

COPY --from=maven_build /tmp/target/nirmish-docker-app.jar nirmish-docker-app.jar

ENTRYPOINT ["java","-jar","nirmish-docker-app.jar"]
