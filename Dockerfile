FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY src/main/java/Employee.java .
RUN javac Employee.java

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/Employee.class .
ENTRYPOINT ["java", "Employee"]
