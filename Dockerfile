# Stage 1: Build the application
FROM amazoncorretto:23 AS builder
WORKDIR /app
COPY . .
RUN mvnw clean package

# Stage 2: Run the application
FROM amazoncorretto:23
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
