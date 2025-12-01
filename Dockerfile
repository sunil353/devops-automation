FROM eclipse-temurin:17-jdk
EXPOSE 8080

# COPY is preferred over ADD for a local file
COPY target/devops-integration.jar /devops-integration.jar

ENTRYPOINT [ "java", "-jar", "/devops-integration.jar" ]

