# Build stage
FROM maven:3.9.0-eclipse-temurin-8-focal AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Runtime stage
FROM tomcat:9.0.121-jdk8-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/BloodDonationManagementSystem.war \
     /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]