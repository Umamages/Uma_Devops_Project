environment {
    registry = "umamages/Uma_Devops_Project"
    registryCredential = 'DockerHub'
}
pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
         sh 'docker build -t buildapp/capstone-part1 .'
      }
    }
    stage('Push to Docker Hub') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
          sh 'docker push buildapp/capstone-part1'
          }
         }
      }
    }
   stage('Deploy with playbook'){
      steps{
        sh 'ansible-playbook deployment-playbook.yaml'
     }
   }
  }
}
