pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('ibrahimtounkaradev')
	}

	stages {

		stage('Build') {

			steps {
                sh 'mvn -f ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline/petclinic clean package'
				sh 'docker build -t ibrahimtounkaradev/petclinic:latest .'
			}
		}
         
		stage('Build Docker Image') {

			steps {
				sh 'docker build -t ibrahimtounkaradev/petclinic:latest .'
			}
		}
		
		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push Docker Image') {

			steps {
				sh 'docker push ibrahimtounkaradev/petclinic:latest'
			}
		}
		
		/*stage('Deploy') {

		   steps {
		       sh "docker stop petclinic | true"
               sh "docker rm petclinic | true"
			   sh "docker run --name petclinic -d -p 9004:8080 ibrahimtounkaradev/petclinic:latest"
		    }
        }*/			
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
