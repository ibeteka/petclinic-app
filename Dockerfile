FROM alpine:3.14
  ADD petclinic/target/petclinic.war petclinic.war
  RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz
  RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz
  RUN wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz
  RUN wget https://cdn.azul.com/zulu/bin/zulu11.54.23-ca-jdk11.0.14-linux_musl_x64.tar.gz