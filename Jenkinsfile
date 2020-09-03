pipeline {
    agent any


    stages {
        stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Ayman1231/Booster_CI_CD_Project'
            }
         stage('Build') {
            steps {
               sh 'docker build -f Dockerfile . -t ayman/project'
            }
             
          stage('Push') {
            steps {
               sh 'docker push aymanhesham/project1:ayman/project'
            }
              
          stage('Deploy') {
            steps {
               sh 'docker run -d -p 3000:3000 ayman/project'
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
                
            }
        }
    }
}
