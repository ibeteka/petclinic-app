FROM alpine:3.14
  ADD petclinic/target/petclinic.war petclinic.war
  
  #Download dependencies
  RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz -O - | tar -xz
  RUN wget https://archive.apache.org/dist/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz -O - | tar -xz
  RUN wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz -O - | tar -xz -C jdk-11
  RUN wget https://cdn.azul.com/zulu/bin/zulu11.54.23-ca-jdk11.0.14-linux_musl_x64.tar.gz -O - | tar -xz -C zulu11.52.13-ca-jdk11.0.13-linux_musl_x64
  
  #Start services
  RUN sh ./build-petclinic.sh
  RUN sh ./start-petclinic.sh
  
  
  #RUN tar -xf apache-tomcat-9.0.55.tar.gz
  #RUN tar -xf apache-maven-3.8.3-bin.tar.gz
  #RUN tar -xf openjdk-11+28_linux-x64_bin.tar.gz
  #RUN tar -xf zulu11.54.23-ca-jdk11.0.14-linux_musl_x64.tar.gz
