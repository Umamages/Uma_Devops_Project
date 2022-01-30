pipeline {
	environment {
    registry = "umamages/devops_project1"
    registryCredential = 'dockerhub'
    }
	agent any
    stages {
        stage('Clone Repository') {
            steps {
               checkout scm
            }
        }
        stage('Build Image') {
            steps {
               bat "docker build -t umamages/devops_project1 ."
            }
        }
        stage('Push image') {
            steps {
               script {
          docker.withRegistry( '', registryCredential ) {
               bat "docker push umamages/devops_project1"
				}
            }
        }
	}
        stage('Pull and Deploy image') {
            steps {
				sshagent(['Stage']) {
                   script{
                docker.withRegistry( '', registryCredential ) {
                                ssh ubuntu@192.168.1.233 docker pull umamages/devops_project1
                                bat "docker run -d -p 8000:80 devops_project1"
                            
                    }
                }
                      
            }
        }
	}
}
