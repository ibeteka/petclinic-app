FROM alpine:3.14
    ADD ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-app-pipeline/petclinic/target/petclinic.war petclinic.war
