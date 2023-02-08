FROM adoptopenjdk/openjdk11:alpine-jre

MAINTAINER mastercard.com

RUN mvn clean package --no-cache

COPY ./target/nirmish-docker-app.jar nirmish-docker-app.jar

ENTRYPOINT ["java","-jar","nirmish-docker-app.jar"]
