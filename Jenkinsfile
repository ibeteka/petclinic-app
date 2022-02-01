pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('ibrahimtounkaradev')
	}

	stages {

		stage('Build') {

			steps {
                sh 'mvn -f ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline/petclinic clean package'
			}
		}
         
		stage('Build Docker Image') {

			steps {
				sh 'cd ~/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline'
				sh 'docker build -f Dockerfile -t ibrahimtounkaradev/petclinic:latest .'
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
		
		stage('Deploy to Production Server') {

		   steps {
		       sh "cd /home/ibrahim/python_training_fitec/jenkins/JENKINS_HOME/workspace/petclinic-pipeline/"
			     sh "kubectl apply -f kubernetes/"
		    }
     }
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
