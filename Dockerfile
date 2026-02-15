FROM eclipse-temurin:17-jre
ADD target/springboot-docker-eks.jar springboot-docker-eks.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","springboot-docker-eks.jar"]
