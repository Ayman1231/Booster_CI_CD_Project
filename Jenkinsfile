pipeline {
    agent any
    
    stages {
         stage('Build') {
            steps {
               sh 'docker build . -t myproject'
            }
         }
             
          stage('Push') {
            steps {
               withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
               sh 'docker login --username $USERNAME --password $PASSWORD' 
               sh 'docker push myproject'
            }
           }
          }
          stage('Deploy') {
            steps {
               sh 'docker run -d -p 9000:8000 myproject'
            }
          }
    }
            post {
                
                success {
                    slackSend (color: '#00FF00' , message: "Successful run")
                }
                failure {
                    slackSend (color: '#E83009' , message: "Fail to run")
                }
                 aborted {
                    slackSend (color: '#E8E200' , message: "Aborted run")
                }             
            }
         }
