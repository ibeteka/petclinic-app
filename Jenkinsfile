pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('ibrahimtounkaradev')
	}

	stages {

		stage('Build') {

			steps {
                sh 'mvn -f ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline/petclinic clean install -P MySQL -DskipTests'
                          }
		}
         
		stage('Build Docker Image') {

			steps {
				sh 'cd ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline'
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
		
		/*stage('Deploy') {

		   steps {
		       sh "docker stop petclinic | true"
               sh "docker rm petclinic | true"
			   sh "docker run --name petclinic -d -p 9004:8080 ibrahimtounkaradev/petclinic-dev:latest"
		    }
        }*/			
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
