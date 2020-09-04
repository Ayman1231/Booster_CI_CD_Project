pipeline {
    agent any
    
    stages {
        stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Ayman1231/Booster_CI_CD_Project'
            }
        }
         stage('Build') {
            steps {
               sh 'docker build -f Dockerfile . -t ayman/project'
            }
         }
             
          stage('Push') {
            steps {
               withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
               sh 'docker login --username $USERNAME --password $PASSWORD'
               sh 'docker push aymanhesham/project1:ayman/project'
            }
           }
          }
          stage('Deploy') {
            steps {
               sh 'docker run -d -p 8080:8080 ayman/project'
            }

            post {
                
                success {
                    slackSend (color: '#00FF00' , message: "Successful run"
                }
                failure {
                    slackSend (color: '#E83009' , message: "Fail to run"
                }
                 aborted {
                    slackSend (color: '#E8E200' , message: "Aborted run"
                }             
            }
        }
    }
}