FROM ubuntu:22.04
RUN apt update
RUN apt install openjdk-17-jdk wget -y
WORKDIR /app
COPY target/spring-petclinic-*.jar app.jar
EXPOSE 7500
CMD ["java", "-jar", "/app/app.jar"]
