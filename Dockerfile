# Etapa de build
FROM gradle:8.5.0-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle bootJar --no-daemon

# Etapa de runtime
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/build/libs/*.jar ledgerly.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ledgerly.jar"]


