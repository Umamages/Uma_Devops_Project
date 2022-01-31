pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
         sh 'docker build -t umamages/devops_project .'
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerhubpass', usernameVariable: 'dockerhubuser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push umamages/devops_project'
         }
      }
    }
 } 


