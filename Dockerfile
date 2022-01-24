FROM alpine:3.14
    COPY ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-app-pipeline/petclinic/target/petclinic.war target/petclinic.war
    ADD target/petclinic.war petclinic.war
