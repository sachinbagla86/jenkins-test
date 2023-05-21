FROM openjdk:8
MAINTAINER sachinbagla86@gmail.com
EXPOSE 8080
COPY target/jenkins-test.jar jenkins-test.jar
CMD ["java" , "-jar" ,"/jenkins-test.jar"]