FROM ubuntu:22.04
RUN apt update
RUN apt install openjdk-17-jdk wget -y
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 7005
CMD ["java", "-jar", "/app/app.jar"]
