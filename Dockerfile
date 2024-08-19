FROM maven:3.8.4-openjdk-17-slim AS spring-build
COPY . /usr/src/app/example/
WORKDIR /usr/src/app/example/
RUN mvn -f pom.xml clean package

# Stage 3: Combine React and Spring Boot apps
FROM maven:3.8.4-openjdk-17-slim
RUN mkdir -p /opt/app
RUN ls -ltr
COPY --from=spring-build /usr/src/app/example/target/studentService-0.0.1-SNAPSHOT.jar /opt/app/app.jar
EXPOSE 8081
CMD ["java", "-jar", "/opt/app/app.jar"]