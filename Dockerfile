FROM tomcat
  ADD petclinic/target/petclinic.war /usr/local/tomcat/webapps/
  EXPOSE 8080
  CMD ["catalina.sh", "run"]