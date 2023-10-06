FROM eclipse-temurin:17-alpine as builder

WORKDIR /app

COPY src /app/src
COPY gradle /app/gradle
COPY build.gradle /app
COPY settings.gradle /app

RUN gradle clean build


FROM eclipse-temurin:17-alpine

WORKDIR /app

COPY --from=builder /app/build/libs/account-service.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]