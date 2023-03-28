# FROM adoptopenjdk/openjdk11:alpine-jre

# FROM maven:3.9-amazoncorretto-17 AS maven_build

# COPY pom.xml /tmp/

# COPY src /tmp/src/

# WORKDIR /tmp/

# RUN mvn clean install

FROM openjdk:11-slim-buster as build                         

RUN chmod +x ./mvnw

COPY .mvn .mvn                                               
COPY mvnw .                                                  
COPY pom.xml .                                               
COPY src src                                                 

RUN ./mvnw -B package                                        

FROM openjdk:11-jre-slim-buster   

COPY --from=build /target/nirmish-docker-app.jar .

ENTRYPOINT ["java","-jar","nirmish-docker-app.jar"]
