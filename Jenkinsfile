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
    #stage('My webapp Deployment with ansible playbook in Minikube Environment'){
     # steps{
      # withCredentials([usernamePassword(credentialsId: 'Live', passwordVariable: 'passwd_Live', usernameVariable: 'user_Live')]) {
	#sh "192.168.1.245 login -u ${env.user_Live} -p ${env.passwd_Live}"
	#sh 'ansible-playbook ansible.yml'
#}
 #      }
  #  }  
  }
}


