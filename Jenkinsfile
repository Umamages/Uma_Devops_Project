pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
         sh 'docker build -t umamages/devops_project .'
      }
    }
    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhubcred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push umamages/devops_project'
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
