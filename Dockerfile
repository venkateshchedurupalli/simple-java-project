FROM tomcat:10.1.9-jdk11
COPY target/*.jar /usr/local/tomcat/webapps/java.jar
