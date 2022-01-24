FROM alpine:3.14
    WORKDIR ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-app-pipeline/petclinic
    ADD target/petclinic.war petclinic.war
