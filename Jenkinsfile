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
        withCredentials([usernamePassword(credentialsId: 'dockerhubcred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push buildapp/capstone-part1'
         }
      }
    }
   stage('Deploy with playbook'){
      steps{
        sh 'ansible-playbook continous-deployment-playbook.yml'
     }
   }
  }
}
