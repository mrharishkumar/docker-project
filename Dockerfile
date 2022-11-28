FROM openjdk:8
EXPOSE 8080
ADD ./target/spring-admin-server-0.0.1-SNAPSHOT.jar spring-admin-server.jar
ENTRYPOINT ["java","-jar","/spring-admin-server.jar"]

