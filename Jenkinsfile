pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('ibrahimtounkaradev')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t ibrahimtounkaradev/petclinic:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push ibrahimtounkaradev/petclinic:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
