pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('ibrahimtounkaradev')
	}

	stages {

		stage('Build') {

			steps {
                sh 'mvn -f ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline-dev/petclinic clean install -P MySQL -DskipTests'
                          }
		}
         
		stage('Build Docker Image') {

			steps {
				sh 'cd ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline-dev'
				sh 'docker build -f Dockerfile -t ibrahimtounkaradev/petclinic-dev:latest .'
			}
		}
		
		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push Docker Image') {

			steps {
				sh 'docker push ibrahimtounkaradev/petclinic-dev:latest'
			}
		}
		
		stage('Deploy in dev environment') {

		   steps {
          sh 'cd ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline-dev/kubernetes'
		      sh("kubectl -f apply database-deployment.yaml  secret-mysql.yml volumeClaim.yml persisentVolume.yaml services.yml webapps-deployment.yml")
		    }
    }
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
