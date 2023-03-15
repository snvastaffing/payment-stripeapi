
FROM maven:3.8.3-jdk-8 as maven
WORKDIR /app
COPY . .
RUN mvn clean
RUN mvn package
FROM openjdk:8-jre-alpine
WORKDIR /project

COPY --from=maven /app/target .
CMD [ "ls" ]
ENTRYPOINT ["java", "-cp", "sample-jar-with-dependencies.jar", "com.stripe.sample.Server"]
# ENTRYPOINT [ "java","-version" ]

