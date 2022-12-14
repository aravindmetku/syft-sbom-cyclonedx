FROM --platform=linux/x86_64 eclipse-temurin:17-jre-alpine

RUN apk -U add curl ca-certificates && rm -f /var/cache/apk/*

USER 65534
EXPOSE 8080

COPY build/libs/*.jar app.jar

ENTRYPOINT ["java", "-Dspring.profiles.active=${ENV}", "-jar", "/app.jar"]

