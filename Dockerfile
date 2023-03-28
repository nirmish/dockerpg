FROM maven:3.9-amazoncorretto-11 AS maven_build
WORKDIR /tmp/
COPY pom.xml /tmp/
COPY src /tmp/src/
RUN mvn install                                        

FROM adoptopenjdk/openjdk11:alpine-jre  
WORKDIR /tmp/
COPY --from=maven_build /tmp/target/nirmish-docker-app.jar .

ENTRYPOINT ["java","-jar","nirmish-docker-app.jar"]
